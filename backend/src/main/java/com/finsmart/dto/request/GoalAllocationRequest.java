package com.finsmart.dto.request;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record GoalAllocationRequest(

        @NotNull(message = "Amount is required")
        @DecimalMin(value = "1.00", message = "Allocation must be at least ₹1")
        BigDecimal amount
) {}
