package com.finsmart.controller;

import com.finsmart.dto.request.BudgetRequest;
import com.finsmart.dto.response.BudgetResponse;
import com.finsmart.service.BudgetService;
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
@RequestMapping("/budgets")
@RequiredArgsConstructor
@Tag(name = "Budgets", description = "Set and track category budgets with Redis-backed atomic counters")
public class BudgetController {

    private final BudgetService budgetService;

    @PostMapping
    @Operation(summary = "Create a budget for a category (current month)")
    public ResponseEntity<BudgetResponse> create(
            @AuthenticationPrincipal UserDetails userDetails,
            @Valid @RequestBody BudgetRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(budgetService.create(userDetails.getUsername(), request));
    }

    @GetMapping
    @Operation(summary = "Get all budgets for the current month")
    public ResponseEntity<List<BudgetResponse>> getCurrentMonth(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(budgetService.getCurrentMonthBudgets(userDetails.getUsername()));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a budget by ID")
    public ResponseEntity<BudgetResponse> getById(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        return ResponseEntity.ok(budgetService.getById(userDetails.getUsername(), id));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update budget limit")
    public ResponseEntity<BudgetResponse> update(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id,
            @Valid @RequestBody BudgetRequest request) {
        return ResponseEntity.ok(budgetService.update(userDetails.getUsername(), id, request));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a budget")
    public ResponseEntity<Void> delete(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        budgetService.delete(userDetails.getUsername(), id);
        return ResponseEntity.noContent().build();
    }
}
