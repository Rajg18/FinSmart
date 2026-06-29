package com.finsmart.dto.request;

import com.finsmart.entity.Transaction;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record TransactionRequest(

        @NotBlank(message = "Merchant name is required")
        String merchant,

        @NotNull(message = "Amount is required")
        @DecimalMin(value = "0.01", message = "Amount must be greater than 0")
        BigDecimal amount,

        @NotNull(message = "Transaction type is required")
        Transaction.TransactionType type,

        @NotNull(message = "Category is required")
        Transaction.Category category,

        String paymentMethod,

        LocalDateTime transactionDate
) {}
