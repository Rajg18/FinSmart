package com.finsmart.batch;

import com.finsmart.service.EmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class MonthlyReportWriter implements ItemWriter<MonthlyReportData> {

    private final EmailService emailService;

    @Override
    public void write(Chunk<? extends MonthlyReportData> chunk) {
        for (MonthlyReportData data : chunk.getItems()) {
            emailService.sendMonthlyReport(data.email(), data.name(), data.reportContent());
            log.info("Monthly report written for user {} — {}/{} spent=₹{} income=₹{}",
                    data.userId(), data.month(), data.year(), data.totalSpent(), data.totalIncome());
        }
    }
}
