package com.finsmart.batch;

import java.math.BigDecimal;

public record MonthlyReportData(
        Long userId,
        String email,
        String name,
        int month,
        int year,
        BigDecimal totalIncome,
        BigDecimal totalSpent,
        BigDecimal netSavings,
        long transactionCount,
        String topCategory,
        String reportContent
) {}
