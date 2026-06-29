package com.finsmart.service;

import com.finsmart.dto.request.GoalAllocationRequest;
import com.finsmart.dto.request.GoalRequest;
import com.finsmart.dto.response.GoalResponse;
import com.finsmart.entity.Goal;
import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.exception.BusinessException;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.mapper.GoalMapper;
import com.finsmart.repository.GoalRepository;
import com.finsmart.repository.TransactionRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class GoalService {

    private final GoalRepository goalRepository;
    private final UserRepository userRepository;
    private final TransactionRepository transactionRepository;
    private final GoalMapper goalMapper;

    @Transactional
    public GoalResponse create(String username, GoalRequest request) {
        User user = findUser(username);

        Goal goal = Goal.builder()
                .user(user)
                .name(request.name())
                .targetAmount(request.targetAmount())
                .savedAmount(BigDecimal.ZERO)
                .deadline(request.deadline())
                .priority(request.priority() != null ? request.priority() : 1)
                .status(Goal.GoalStatus.IN_PROGRESS)
                .build();

        goal.setRequiredMonthly(calculateRequiredMonthly(goal));
        Goal saved = goalRepository.save(goal);
        log.info("Goal created: {} for user {}", saved.getName(), username);
        return goalMapper.toResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<GoalResponse> getAll(String username) {
        User user = findUser(username);
        return goalRepository.findByUserIdOrderByPriorityAsc(user.getId())
                .stream()
                .map(goalMapper::toResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public GoalResponse getById(String username, Long goalId) {
        User user = findUser(username);
        return goalMapper.toResponse(findGoal(goalId, user.getId()));
    }

    @Transactional
    public GoalResponse update(String username, Long goalId, GoalRequest request) {
        User user = findUser(username);
        Goal goal = findGoal(goalId, user.getId());

        goal.setName(request.name());
        goal.setTargetAmount(request.targetAmount());
        goal.setDeadline(request.deadline());
        if (request.priority() != null) goal.setPriority(request.priority());
        if (request.status() != null) goal.setStatus(request.status());
        goal.setRequiredMonthly(calculateRequiredMonthly(goal));

        return goalMapper.toResponse(goalRepository.save(goal));
    }

    @Transactional
    public GoalResponse allocate(String username, Long goalId, GoalAllocationRequest request) {
        User user = findUser(username);
        Goal goal = findGoal(goalId, user.getId());

        if (goal.getStatus() == Goal.GoalStatus.COMPLETED) {
            throw new BusinessException("Goal is already completed");
        }

        goal.setSavedAmount(goal.getSavedAmount().add(request.amount()));

        if (goal.getSavedAmount().compareTo(goal.getTargetAmount()) >= 0) {
            goal.setStatus(Goal.GoalStatus.COMPLETED);
            log.info("Goal '{}' completed for user {}", goal.getName(), username);
        }

        goal.setRequiredMonthly(calculateRequiredMonthly(goal));
        goalRepository.save(goal);

        Transaction allocation = Transaction.builder()
                .user(user)
                .merchant(goal.getName())
                .amount(request.amount())
                .type(Transaction.TransactionType.GOAL_ALLOCATION)
                .category(Transaction.Category.SAVINGS)
                .paymentMethod("Internal Transfer")
                .source(Transaction.TransactionSource.MANUAL)
                .transactionDate(LocalDateTime.now())
                .build();
        transactionRepository.save(allocation);

        return goalMapper.toResponse(goal);
    }

    @Transactional
    public void delete(String username, Long goalId) {
        User user = findUser(username);
        Goal goal = findGoal(goalId, user.getId());
        goalRepository.delete(goal);
    }

    private BigDecimal calculateRequiredMonthly(Goal goal) {
        if (goal.getDeadline() == null) return null;

        BigDecimal remaining = goal.getTargetAmount().subtract(goal.getSavedAmount());
        if (remaining.compareTo(BigDecimal.ZERO) <= 0) return BigDecimal.ZERO;

        long months = ChronoUnit.MONTHS.between(LocalDate.now(), goal.getDeadline());
        if (months <= 0) return remaining;

        return remaining.divide(BigDecimal.valueOf(months), 2, RoundingMode.CEILING);
    }

    private Goal findGoal(Long goalId, Long userId) {
        return goalRepository.findByIdAndUserId(goalId, userId)
                .orElseThrow(() -> new ResourceNotFoundException("Goal not found: " + goalId));
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
