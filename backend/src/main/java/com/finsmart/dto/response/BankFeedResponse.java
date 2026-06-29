package com.finsmart.dto.response;

import java.time.LocalDateTime;
import java.util.List;

public record BankFeedResponse(
        int transactionsAdded,
        List<TransactionResponse> transactions,
        LocalDateTime syncedAt,
        LocalDateTime nextSlotAvailableAt
) {}
