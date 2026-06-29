package com.finsmart.dto.response;

import com.finsmart.entity.Transaction;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record TransactionResponse(
        Long id,
        String merchant,
        BigDecimal amount,
        Transaction.TransactionType type,
        Transaction.Category category,
        String paymentMethod,
        Transaction.TransactionSource source,
        LocalDateTime transactionDate,
        LocalDateTime createdAt
) {}
