package com.finsmart.dto.response;

import com.finsmart.entity.Transaction;

import java.math.BigDecimal;
import java.util.List;

public record CategoryBreakdownResponse(
        int month,
        int year,
        BigDecimal totalSpent,
        List<CategoryBreakdownItem> breakdown
) {
    public record CategoryBreakdownItem(
            Transaction.Category category,
            BigDecimal amount,
            double percentage
    ) {}
}
