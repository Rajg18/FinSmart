package com.finsmart.dto.response;

import com.finsmart.entity.Goal;

import java.math.BigDecimal;
import java.time.LocalDate;

public record GoalResponse(
        Long id,
        String name,
        BigDecimal targetAmount,
        BigDecimal savedAmount,
        BigDecimal remainingAmount,
        BigDecimal requiredMonthly,
        double progressPercent,
        LocalDate deadline,
        int priority,
        Goal.GoalStatus status
) {}
