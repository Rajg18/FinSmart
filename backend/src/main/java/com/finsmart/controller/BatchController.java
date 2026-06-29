package com.finsmart.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/batch")
@RequiredArgsConstructor
@Slf4j
@Tag(name = "Batch", description = "Spring Batch job triggers — for admin/testing use")
public class BatchController {

    private final JobLauncher jobLauncher;
    private final Job monthlyReportJob;

    @PostMapping("/monthly-report/run")
    @Operation(summary = "Manually trigger the monthly report email job (normally runs 1st of month at 6 AM)")
    public ResponseEntity<Map<String, String>> runMonthlyReport(
            @AuthenticationPrincipal UserDetails userDetails) {
        try {
            JobParameters params = new JobParametersBuilder()
                    .addLong("runAt", System.currentTimeMillis())
                    .addString("triggeredBy", userDetails.getUsername())
                    .toJobParameters();

            JobExecution execution = jobLauncher.run(monthlyReportJob, params);
            log.info("Monthly report manually triggered by {}, status: {}",
                    userDetails.getUsername(), execution.getStatus());

            return ResponseEntity.ok(Map.of(
                    "status", execution.getStatus().name(),
                    "jobId", String.valueOf(execution.getJobId()),
                    "exitCode", execution.getExitStatus().getExitCode()
            ));
        } catch (Exception ex) {
            log.error("Manual batch trigger failed: {}", ex.getMessage());
            return ResponseEntity.internalServerError().body(Map.of(
                    "status", "FAILED",
                    "message", ex.getMessage()
            ));
        }
    }
}
