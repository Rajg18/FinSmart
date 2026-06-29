package com.finsmart.controller;

import com.finsmart.dto.response.BankFeedResponse;
import com.finsmart.dto.response.DashboardResponse;
import com.finsmart.service.DashboardService;
import com.finsmart.service.MockBankFeedService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@Tag(name = "Dashboard", description = "Financial snapshot and mock bank feed sync")
public class DashboardController {

    private final DashboardService dashboardService;
    private final MockBankFeedService mockBankFeedService;

    @GetMapping("/dashboard")
    @Operation(summary = "Get complete financial dashboard — balance, budgets, goals, subscriptions")
    public ResponseEntity<DashboardResponse> getDashboard(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(dashboardService.getDashboard(userDetails.getUsername()));
    }

    @PostMapping("/bank-feed/sync")
    @Operation(summary = "Trigger mock bank feed sync — generates 5-8 realistic transactions (6-hour cooldown)")
    public ResponseEntity<BankFeedResponse> sync(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(mockBankFeedService.sync(userDetails.getUsername()));
    }
}
