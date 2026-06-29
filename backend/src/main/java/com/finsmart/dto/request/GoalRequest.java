package com.finsmart.dto.request;

import com.finsmart.entity.Goal;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDate;

public record GoalRequest(

        @NotBlank(message = "Goal name is required")
        String name,

        @NotNull(message = "Target amount is required")
        @DecimalMin(value = "1.00", message = "Target must be at least ₹1")
        BigDecimal targetAmount,

        LocalDate deadline,

        @Min(value = 1, message = "Priority must be at least 1")
        Integer priority,

        Goal.GoalStatus status
) {}
