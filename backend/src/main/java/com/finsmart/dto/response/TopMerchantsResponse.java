package com.finsmart.dto.response;

import java.math.BigDecimal;
import java.util.List;

public record TopMerchantsResponse(
        int month,
        int year,
        List<MerchantStat> merchants
) {
    public record MerchantStat(
            String merchant,
            BigDecimal totalSpent,
            long transactionCount
    ) {}
}
