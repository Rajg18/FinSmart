package com.finsmart.config;

import com.finsmart.batch.MonthlyReportData;
import com.finsmart.batch.MonthlyReportProcessor;
import com.finsmart.batch.MonthlyReportWriter;
import com.finsmart.entity.User;
import jakarta.persistence.EntityManagerFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.batch.item.database.JpaPagingItemReader;
import org.springframework.batch.item.database.builder.JpaPagingItemReaderBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@RequiredArgsConstructor
public class MonthlyReportJobConfig {

    private final JobRepository jobRepository;
    private final PlatformTransactionManager transactionManager;
    private final EntityManagerFactory entityManagerFactory;
    private final MonthlyReportProcessor processor;
    private final MonthlyReportWriter writer;

    @Bean
    public Job monthlyReportJob() {
        return new JobBuilder("monthlyReportJob", jobRepository)
                .start(monthlyReportStep())
                .build();
    }

    @Bean
    public Step monthlyReportStep() {
        return new StepBuilder("monthlyReportStep", jobRepository)
                .<User, MonthlyReportData>chunk(10, transactionManager)
                .reader(userItemReader())
                .processor(processor)
                .writer(writer)
                .build();
    }

    @Bean
    public JpaPagingItemReader<User> userItemReader() {
        return new JpaPagingItemReaderBuilder<User>()
                .name("userItemReader")
                .entityManagerFactory(entityManagerFactory)
                .queryString("SELECT u FROM User u WHERE u.emailAlerts = true AND u.email IS NOT NULL AND u.email <> '' ORDER BY u.id")
                .pageSize(10)
                .build();
    }
}
