package com.finsmart.controller;

import com.finsmart.dto.request.TransactionRequest;
import com.finsmart.dto.response.TransactionResponse;
import com.finsmart.entity.Transaction;
import com.finsmart.service.TransactionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/transactions")
@RequiredArgsConstructor
@Tag(name = "Transactions", description = "Manage income, expenses and goal allocations")
public class TransactionController {

    private final TransactionService transactionService;

    @PostMapping
    @Operation(summary = "Add a manual transaction")
    public ResponseEntity<TransactionResponse> create(
            @AuthenticationPrincipal UserDetails userDetails,
            @Valid @RequestBody TransactionRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(transactionService.create(userDetails.getUsername(), request));
    }

    @GetMapping
    @Operation(summary = "List transactions with optional type/category filter and pagination")
    public ResponseEntity<Page<TransactionResponse>> getAll(
            @AuthenticationPrincipal UserDetails userDetails,
            @RequestParam(required = false) Transaction.TransactionType type,
            @RequestParam(required = false) Transaction.Category category,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("transactionDate").descending());
        return ResponseEntity.ok(transactionService.getAll(userDetails.getUsername(), type, category, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a single transaction by ID")
    public ResponseEntity<TransactionResponse> getById(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        return ResponseEntity.ok(transactionService.getById(userDetails.getUsername(), id));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update a transaction")
    public ResponseEntity<TransactionResponse> update(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id,
            @Valid @RequestBody TransactionRequest request) {
        return ResponseEntity.ok(transactionService.update(userDetails.getUsername(), id, request));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Soft-delete a transaction (financial records are never hard-deleted)")
    public ResponseEntity<Void> delete(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        transactionService.softDelete(userDetails.getUsername(), id);
        return ResponseEntity.noContent().build();
    }
}
