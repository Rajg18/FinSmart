package com.finsmart.controller;

import com.finsmart.dto.request.SubscriptionRequest;
import com.finsmart.dto.response.SubscriptionResponse;
import com.finsmart.dto.response.SubscriptionSummaryResponse;
import com.finsmart.service.SubscriptionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/subscriptions")
@RequiredArgsConstructor
@Tag(name = "Subscriptions", description = "Recurring subscription tracking with monthly cost normalization")
public class SubscriptionController {

    private final SubscriptionService subscriptionService;

    @PostMapping
    @Operation(summary = "Add a new subscription")
    public ResponseEntity<SubscriptionResponse> create(
            @AuthenticationPrincipal UserDetails userDetails,
            @Valid @RequestBody SubscriptionRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(subscriptionService.create(userDetails.getUsername(), request));
    }

    @GetMapping
    @Operation(summary = "List subscriptions (activeOnly=true by default)")
    public ResponseEntity<List<SubscriptionResponse>> getAll(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam(defaultValue = "true") boolean activeOnly) {
        return ResponseEntity.ok(subscriptionService.getAll(userDetails.getUsername(), activeOnly));
    }

    @GetMapping("/summary")
    @Operation(summary = "Get active subscriptions with total monthly burden")
    public ResponseEntity<SubscriptionSummaryResponse> getSummary(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(subscriptionService.getSummary(userDetails.getUsername()));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a subscription by ID")
    public ResponseEntity<SubscriptionResponse> getById(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        return ResponseEntity.ok(subscriptionService.getById(userDetails.getUsername(), id));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update a subscription")
    public ResponseEntity<SubscriptionResponse> update(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id,
            @Valid @RequestBody SubscriptionRequest request) {
        return ResponseEntity.ok(subscriptionService.update(userDetails.getUsername(), id, request));
    }

    @PatchMapping("/{id}/toggle")
    @Operation(summary = "Toggle subscription active/inactive")
    public ResponseEntity<SubscriptionResponse> toggle(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        return ResponseEntity.ok(subscriptionService.toggle(userDetails.getUsername(), id));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a subscription")
    public ResponseEntity<Void> delete(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        subscriptionService.delete(userDetails.getUsername(), id);
        return ResponseEntity.noContent().build();
    }
}
