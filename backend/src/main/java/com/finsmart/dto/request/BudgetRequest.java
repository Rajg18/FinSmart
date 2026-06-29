package com.finsmart.dto.request;

import com.finsmart.entity.Transaction;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record BudgetRequest(

        @NotNull(message = "Category is required")
        Transaction.Category category,

        @NotNull(message = "Limit amount is required")
        @DecimalMin(value = "1.00", message = "Limit must be at least ₹1")
        BigDecimal limitAmount
) {}
