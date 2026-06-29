package com.finsmart.controller;

import com.finsmart.dto.request.LoginRequest;
import com.finsmart.dto.request.RegisterRequest;
import com.finsmart.dto.response.AuthResponse;
import com.finsmart.service.AuthService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@Tag(name = "Authentication", description = "Register and login endpoints")
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    @Operation(summary = "Register a new user — sends a verification email before allowing login")
    public ResponseEntity<Void> register(@Valid @RequestBody RegisterRequest request) {
        authService.register(request);
        return ResponseEntity.status(HttpStatus.ACCEPTED).build();
    }

    @GetMapping("/verify")
    @Operation(summary = "Verify email using token from the verification link")
    public ResponseEntity<AuthResponse> verify(@RequestParam String token) {
        return ResponseEntity.ok(authService.verifyEmail(token));
    }

    @PostMapping("/login")
    @Operation(summary = "Login with username + password. Use demo/demo123 for demo access.")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }

    @PostMapping("/demo")
    @Operation(summary = "Start a fresh isolated demo session")
    public ResponseEntity<AuthResponse> demo() {
        return ResponseEntity.ok(authService.loginDemo());
    }

    @PostMapping("/logout")
    @Operation(summary = "Logout — cleans up all data for demo sessions")
    public ResponseEntity<Void> logout(@AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            authService.logout(userDetails.getUsername());
        }
        return ResponseEntity.noContent().build();
    }
}
