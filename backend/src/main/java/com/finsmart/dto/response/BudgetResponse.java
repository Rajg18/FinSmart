package com.finsmart.dto.response;

import com.finsmart.entity.Transaction;

import java.math.BigDecimal;

public record BudgetResponse(
        Long id,
        Transaction.Category category,
        BigDecimal limitAmount,
        BigDecimal spentAmount,
        BigDecimal remainingAmount,
        double percentageUsed,
        int month,
        int year
) {}
