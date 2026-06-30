package com.finsmart.dto.response;

public record AuthResponse(
        String token,
        String username,
        String name,
        String role
) {}
