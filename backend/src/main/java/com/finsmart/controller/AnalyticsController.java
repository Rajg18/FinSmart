package com.finsmart.controller;

import com.finsmart.dto.response.CategoryBreakdownResponse;
import com.finsmart.dto.response.MonthlyComparisonResponse;
import com.finsmart.dto.response.SpendingTrendResponse;
import com.finsmart.dto.response.TopMerchantsResponse;
import com.finsmart.service.AnalyticsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/analytics")
@RequiredArgsConstructor
@Tag(name = "Analytics", description = "Spending insights — category breakdown, monthly comparison, trends, top merchants")
public class AnalyticsController {

    private final AnalyticsService analyticsService;

    @GetMapping("/category-breakdown")
    @Operation(summary = "Spending by category for a given month")
    public ResponseEntity<CategoryBreakdownResponse> getCategoryBreakdown(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam int month,
            @RequestParam int year) {
        return ResponseEntity.ok(
                analyticsService.getCategoryBreakdown(userDetails.getUsername(), month, year));
    }

    @GetMapping("/monthly-comparison")
    @Operation(summary = "Compare total spending and income between two months")
    public ResponseEntity<MonthlyComparisonResponse> getMonthlyComparison(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam int month1,
            @RequestParam int year1,
            @RequestParam int month2,
            @RequestParam int year2) {
        return ResponseEntity.ok(
                analyticsService.getMonthlyComparison(
                        userDetails.getUsername(), month1, year1, month2, year2));
    }

    @GetMapping("/spending-trend")
    @Operation(summary = "Monthly spending and income trend for the last N months (default 6, max 12)")
    public ResponseEntity<SpendingTrendResponse> getSpendingTrend(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam(defaultValue = "6") int months) {
        int capped = Math.min(Math.max(months, 1), 12);
        return ResponseEntity.ok(
                analyticsService.getSpendingTrend(userDetails.getUsername(), capped));
    }

    @GetMapping("/top-merchants")
    @Operation(summary = "Top merchants by spend for a given month (default top 5)")
    public ResponseEntity<TopMerchantsResponse> getTopMerchants(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam int month,
            @RequestParam int year,
            @RequestParam(defaultValue = "5") int limit) {
        int capped = Math.min(Math.max(limit, 1), 20);
        return ResponseEntity.ok(
                analyticsService.getTopMerchants(userDetails.getUsername(), month, year, capped));
    }
}
