package com.finsmart.messaging;

import java.io.Serializable;

public record AlertMessage(
        Long userId,
        String username,
        String email,
        String alertType,
        String category,
        double percentageUsed,
        double spentAmount,
        double limitAmount
) implements Serializable {}
