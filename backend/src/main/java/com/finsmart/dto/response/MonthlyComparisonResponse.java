package com.finsmart.dto.response;

import java.math.BigDecimal;

public record MonthlyComparisonResponse(
        MonthSummary period1,
        MonthSummary period2,
        BigDecimal difference,
        double changePercent
) {
    public record MonthSummary(
            int month,
            int year,
            BigDecimal totalSpent,
            BigDecimal totalIncome,
            long transactionCount
    ) {}
}
