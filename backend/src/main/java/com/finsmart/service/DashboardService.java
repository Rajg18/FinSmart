package com.finsmart.service;

import com.finsmart.dto.response.DashboardResponse;
import com.finsmart.dto.response.TransactionResponse;
import com.finsmart.entity.Goal;
import com.finsmart.entity.Subscription;
import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.mapper.SubscriptionMapper;
import com.finsmart.mapper.TransactionMapper;
import com.finsmart.repository.BudgetRepository;
import com.finsmart.repository.GoalRepository;
import com.finsmart.repository.SubscriptionRepository;
import com.finsmart.repository.TransactionRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final UserRepository userRepository;
    private final TransactionRepository transactionRepository;
    private final TransactionMapper transactionMapper;
    private final BudgetRepository budgetRepository;
    private final GoalRepository goalRepository;
    private final SubscriptionRepository subscriptionRepository;
    private final SubscriptionMapper subscriptionMapper;

    @Transactional(readOnly = true)
    public DashboardResponse getDashboard(String username) {
        User user = findUser(username);
        Long userId = user.getId();

        LocalDate today = LocalDate.now();
        LocalDateTime monthStart = today.withDayOfMonth(1).atStartOfDay();
        LocalDateTime monthEnd = today.plusMonths(1).withDayOfMonth(1).atStartOfDay();
        LocalDateTime epoch = LocalDateTime.of(2000, 1, 1, 0, 0);
        LocalDateTime now = LocalDateTime.now();

        // All-time totals → current balance
        BigDecimal totalCredit = transactionRepository.sumByUserAndTypeAndDateRange(userId, Transaction.TransactionType.CREDIT, epoch, now);
        BigDecimal totalDebit = transactionRepository.sumByUserAndTypeAndDateRange(userId, Transaction.TransactionType.DEBIT, epoch, now);
        BigDecimal totalGoalAlloc = transactionRepository.sumByUserAndTypeAndDateRange(userId, Transaction.TransactionType.GOAL_ALLOCATION, epoch, now);
        BigDecimal currentBalance = totalCredit.subtract(totalDebit).subtract(totalGoalAlloc);

        // Current month income and expenses
        BigDecimal monthlyIncome = transactionRepository.sumByUserAndTypeAndDateRange(userId, Transaction.TransactionType.CREDIT, monthStart, monthEnd);
        BigDecimal monthlyExpenses = transactionRepository.sumByUserAndTypeAndDateRange(userId, Transaction.TransactionType.DEBIT, monthStart, monthEnd);

        // Projected end-of-month expense based on daily burn rate
        BigDecimal projected = BigDecimal.ZERO;
        int dayOfMonth = today.getDayOfMonth();
        if (dayOfMonth > 0 && monthlyExpenses.compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal dailyRate = monthlyExpenses.divide(BigDecimal.valueOf(dayOfMonth), 2, RoundingMode.HALF_UP);
            projected = dailyRate.multiply(BigDecimal.valueOf(today.lengthOfMonth()));
        }

        // Recent transactions (top 10)
        List<TransactionResponse> recent = transactionRepository
                .findTop10ByUserIdAndDeletedFalseOrderByTransactionDateDesc(userId)
                .stream().map(transactionMapper::toResponse).toList();

        // Current month budgets
        List<DashboardResponse.BudgetCard> budgets = budgetRepository
                .findByUserIdAndMonthAndYear(userId, today.getMonthValue(), today.getYear())
                .stream()
                .map(b -> {
                    double pct = b.getLimitAmount().compareTo(BigDecimal.ZERO) == 0 ? 0.0
                            : b.getSpentAmount()
                                    .divide(b.getLimitAmount(), 4, RoundingMode.HALF_UP)
                                    .multiply(BigDecimal.valueOf(100))
                                    .doubleValue();
                    return new DashboardResponse.BudgetCard(
                            b.getCategory(), b.getLimitAmount(), b.getSpentAmount(), pct);
                }).toList();

        // In-progress goals ordered by priority
        List<DashboardResponse.GoalCard> goals = goalRepository
                .findByUserIdAndStatusOrderByPriorityAsc(userId, Goal.GoalStatus.IN_PROGRESS)
                .stream()
                .map(g -> {
                    double pct = g.getTargetAmount().compareTo(BigDecimal.ZERO) == 0 ? 0.0
                            : g.getSavedAmount()
                                    .divide(g.getTargetAmount(), 4, RoundingMode.HALF_UP)
                                    .multiply(BigDecimal.valueOf(100))
                                    .doubleValue();
                    return new DashboardResponse.GoalCard(
                            g.getId(), g.getName(), g.getTargetAmount(),
                            g.getSavedAmount(), pct, g.getRequiredMonthly(), g.getDeadline());
                }).toList();

        // Active subscription summary
        List<Subscription> activeSubs = subscriptionRepository.findByUserIdAndActiveTrue(userId);
        BigDecimal totalMonthlyBurden = activeSubs.stream()
                .map(subscriptionMapper::monthlyEquivalent)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        DashboardResponse.SubscriptionCard subCard =
                new DashboardResponse.SubscriptionCard(activeSubs.size(), totalMonthlyBurden);

        // Salary banner — largest INCOME CREDIT this month (min ₹10,000 to qualify)
        DashboardResponse.SalaryBanner salaryBanner = null;
        List<Transaction> incomes = transactionRepository.findIncomeCreditsInRange(
                userId, monthStart, monthEnd, PageRequest.of(0, 1));
        if (!incomes.isEmpty() && incomes.get(0).getAmount().compareTo(BigDecimal.valueOf(10000)) >= 0) {
            Transaction salary = incomes.get(0);
            salaryBanner = new DashboardResponse.SalaryBanner(
                    salary.getAmount(), salary.getMerchant(), salary.getTransactionDate());
        }

        return new DashboardResponse(currentBalance, monthlyIncome, monthlyExpenses,
                projected, recent, budgets, goals, subCard, salaryBanner);
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
