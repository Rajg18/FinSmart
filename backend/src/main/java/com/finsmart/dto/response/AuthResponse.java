package com.finsmart.dto.response;

public record AuthResponse(
        String token,
        String username,
        String name,
        boolean emailAlerts,
        String role
) {}
