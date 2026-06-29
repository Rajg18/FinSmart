package com.finsmart.dto.response;

import java.math.BigDecimal;
import java.util.List;

public record SubscriptionSummaryResponse(
        List<SubscriptionResponse> subscriptions,
        int activeCount,
        BigDecimal totalMonthlyBurden
) {}
