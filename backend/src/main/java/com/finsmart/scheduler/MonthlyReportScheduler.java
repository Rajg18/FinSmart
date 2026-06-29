package com.finsmart.scheduler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class MonthlyReportScheduler {

    private final JobLauncher jobLauncher;
    private final Job monthlyReportJob;

    // Runs at 6:00 AM on the 1st of every month (after BudgetReset at midnight)
    @Scheduled(cron = "0 0 6 1 * *")
    public void runMonthlyReport() {
        try {
            JobParameters params = new JobParametersBuilder()
                    .addLong("runAt", System.currentTimeMillis())
                    .addString("triggeredBy", "scheduler")
                    .toJobParameters();
            var execution = jobLauncher.run(monthlyReportJob, params);
            log.info("Monthly report job finished — status: {}", execution.getStatus());
        } catch (Exception ex) {
            log.error("Monthly report job failed: {}", ex.getMessage());
        }
    }
}
