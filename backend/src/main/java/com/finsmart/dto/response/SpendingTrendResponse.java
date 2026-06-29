package com.finsmart.dto.response;

import java.math.BigDecimal;
import java.util.List;

public record SpendingTrendResponse(
        List<MonthlyPoint> trend
) {
    public record MonthlyPoint(
            int month,
            int year,
            BigDecimal totalSpent,
            BigDecimal totalIncome
    ) {}
}
