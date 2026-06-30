package com.finsmart.service;

import com.finsmart.dto.request.BudgetRequest;
import com.finsmart.dto.response.BudgetResponse;
import com.finsmart.entity.Budget;
import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.exception.ConflictException;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.mapper.BudgetMapper;
import com.finsmart.repository.BudgetRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
@Slf4j
public class BudgetService {

    private final BudgetRepository budgetRepository;
    private final UserRepository userRepository;
    private final BudgetMapper budgetMapper;
    private final RedisTemplate<String, String> redisTemplate;

    private static final String REDIS_KEY = "budget:%d:%s:%d:%d";

    @Transactional
    public BudgetResponse create(String username, BudgetRequest request) {
        User user = findUser(username);
        LocalDate now = LocalDate.now();

        boolean exists = budgetRepository
                .findByUserIdAndCategoryAndMonthAndYear(user.getId(), request.category(), now.getMonthValue(), now.getYear())
                .isPresent();

        if (exists) {
            throw new ConflictException("Budget for " + request.category() + " already exists this month");
        }

        Budget budget = Budget.builder()
                .user(user)
                .category(request.category())
                .limitAmount(request.limitAmount())
                .month(now.getMonthValue())
                .year(now.getYear())
                .build();

        Budget saved = budgetRepository.save(budget);
        tryInitRedisCounter(saved);
        return budgetMapper.toResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<BudgetResponse> getCurrentMonthBudgets(String username) {
        User user = findUser(username);
        LocalDate now = LocalDate.now();
        return budgetRepository
                .findByUserIdAndMonthAndYear(user.getId(), now.getMonthValue(), now.getYear())
                .stream()
                .map(b -> trySyncFromRedis(b, user.getId()))
                .map(budgetMapper::toResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public BudgetResponse getById(String username, Long budgetId) {
        User user = findUser(username);
        Budget budget = findBudget(budgetId, user.getId());
        return budgetMapper.toResponse(trySyncFromRedis(budget, user.getId()));
    }

    @Transactional
    public BudgetResponse update(String username, Long budgetId, BudgetRequest request) {
        User user = findUser(username);
        Budget budget = findBudget(budgetId, user.getId());
        budget.setLimitAmount(request.limitAmount());
        return budgetMapper.toResponse(budgetRepository.save(budget));
    }

    @Transactional
    public void delete(String username, Long budgetId) {
        User user = findUser(username);
        Budget budget = findBudget(budgetId, user.getId());
        String key = redisKey(user.getId(), budget.getCategory(), budget.getMonth(), budget.getYear());
        try { redisTemplate.delete(key); } catch (Exception ex) { log.warn("Redis delete failed: {}", ex.getMessage()); }
        budgetRepository.delete(budget);
    }

    @Transactional
    public void recordSpending(User user, Transaction.Category category, BigDecimal amount) {
        LocalDate now = LocalDate.now();
        budgetRepository
                .findByUserIdAndCategoryAndMonthAndYear(user.getId(), category, now.getMonthValue(), now.getYear())
                .ifPresent(budget -> {
                    try {
                        String key = redisKey(user.getId(), category, now.getMonthValue(), now.getYear());
                        Long newCents = redisTemplate.opsForValue().increment(key, amount.multiply(BigDecimal.valueOf(100)).longValue());
                        if (newCents != null) {
                            budget.setSpentAmount(BigDecimal.valueOf(newCents).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP));
                        } else {
                            budget.setSpentAmount(budget.getSpentAmount().add(amount));
                        }
                    } catch (Exception ex) {
                        log.warn("Redis unavailable, falling back to DB for spending: {}", ex.getMessage());
                        budget.setSpentAmount(budget.getSpentAmount().add(amount));
                    }
                    budgetRepository.save(budget);
                });
    }

    private void tryInitRedisCounter(Budget budget) {
        try {
            String key = redisKey(budget.getUser().getId(), budget.getCategory(), budget.getMonth(), budget.getYear());
            long cents = budget.getSpentAmount().multiply(BigDecimal.valueOf(100)).longValue();
            redisTemplate.opsForValue().set(key, String.valueOf(cents), 35, TimeUnit.DAYS);
        } catch (Exception ex) {
            log.warn("Redis unavailable, skipping counter init: {}", ex.getMessage());
        }
    }

    private Budget trySyncFromRedis(Budget budget, Long userId) {
        try {
            String key = redisKey(userId, budget.getCategory(), budget.getMonth(), budget.getYear());
            String value = redisTemplate.opsForValue().get(key);
            if (value != null) {
                budget.setSpentAmount(BigDecimal.valueOf(Long.parseLong(value)).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP));
            }
        } catch (Exception ex) {
            log.warn("Redis unavailable, using DB value for budget {}: {}", budget.getId(), ex.getMessage());
        }
        return budget;
    }

    private String redisKey(Long userId, Transaction.Category category, int month, int year) {
        return String.format(REDIS_KEY, userId, category.name(), month, year);
    }

    private Budget findBudget(Long budgetId, Long userId) {
        return budgetRepository.findByIdAndUserId(budgetId, userId)
                .orElseThrow(() -> new ResourceNotFoundException("Budget not found: " + budgetId));
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
