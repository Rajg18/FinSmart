package com.finsmart.dto.response;

import com.finsmart.entity.Transaction;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public record DashboardResponse(
        BigDecimal currentBalance,
        BigDecimal monthlyIncome,
        BigDecimal monthlyExpenses,
        BigDecimal projectedMonthlyExpense,
        List<TransactionResponse> recentTransactions,
        List<BudgetCard> budgets,
        List<GoalCard> goals,
        SubscriptionCard subscriptions,
        SalaryBanner salaryBanner
) {
    public record BudgetCard(
            Transaction.Category category,
            BigDecimal limitAmount,
            BigDecimal spentAmount,
            double percentageUsed
    ) {}

    public record GoalCard(
            Long id,
            String name,
            BigDecimal targetAmount,
            BigDecimal savedAmount,
            double progressPercent,
            BigDecimal requiredMonthly,
            LocalDate deadline
    ) {}

    public record SubscriptionCard(
            int activeCount,
            BigDecimal totalMonthlyBurden
    ) {}

    public record SalaryBanner(
            BigDecimal amount,
            String merchant,
            LocalDateTime creditedAt
    ) {}
}
