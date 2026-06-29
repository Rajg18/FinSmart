package com.finsmart.dto.response;

import com.finsmart.entity.Subscription;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public record SubscriptionResponse(
        Long id,
        String name,
        BigDecimal amount,
        Subscription.BillingCycle billingCycle,
        BigDecimal monthlyEquivalent,
        LocalDate startDate,
        LocalDate endDate,
        LocalDate renewalDate,
        boolean active,
        LocalDateTime createdAt
) {}
