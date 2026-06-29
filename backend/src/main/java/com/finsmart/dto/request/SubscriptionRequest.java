package com.finsmart.dto.request;

import com.finsmart.entity.Subscription;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDate;

public record SubscriptionRequest(

        @NotBlank(message = "Subscription name is required")
        String name,

        @NotNull(message = "Amount is required")
        @DecimalMin(value = "1.00", message = "Amount must be at least ₹1")
        BigDecimal amount,

        @NotNull(message = "Billing cycle is required")
        Subscription.BillingCycle billingCycle,

        @NotNull(message = "Start date is required")
        LocalDate startDate,

        LocalDate endDate
) {}
