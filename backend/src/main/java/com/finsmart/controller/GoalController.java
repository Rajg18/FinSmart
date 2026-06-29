package com.finsmart.controller;

import com.finsmart.dto.request.GoalAllocationRequest;
import com.finsmart.dto.request.GoalRequest;
import com.finsmart.dto.response.GoalResponse;
import com.finsmart.service.GoalService;
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
@RequestMapping("/goals")
@RequiredArgsConstructor
@Tag(name = "Goals", description = "Savings goals with Pay Yourself First allocation")
public class GoalController {

    private final GoalService goalService;

    @PostMapping
    @Operation(summary = "Create a new savings goal")
    public ResponseEntity<GoalResponse> create(
            @AuthenticationPrincipal UserDetails userDetails,
            @Valid @RequestBody GoalRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(goalService.create(userDetails.getUsername(), request));
    }

    @GetMapping
    @Operation(summary = "Get all goals ordered by priority")
    public ResponseEntity<List<GoalResponse>> getAll(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(goalService.getAll(userDetails.getUsername()));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a goal by ID")
    public ResponseEntity<GoalResponse> getById(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        return ResponseEntity.ok(goalService.getById(userDetails.getUsername(), id));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update goal details")
    public ResponseEntity<GoalResponse> update(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id,
            @Valid @RequestBody GoalRequest request) {
        return ResponseEntity.ok(goalService.update(userDetails.getUsername(), id, request));
    }

    @PostMapping("/{id}/allocate")
    @Operation(summary = "Allocate money to a goal — creates a GOAL_ALLOCATION transaction")
    public ResponseEntity<GoalResponse> allocate(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id,
            @Valid @RequestBody GoalAllocationRequest request) {
        return ResponseEntity.ok(goalService.allocate(userDetails.getUsername(), id, request));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete a goal")
    public ResponseEntity<Void> delete(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable Long id) {
        goalService.delete(userDetails.getUsername(), id);
        return ResponseEntity.noContent().build();
    }
}
