package com.finsmart.scheduler;

import com.finsmart.repository.BudgetRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.Set;

@Component
@RequiredArgsConstructor
@Slf4j
public class BudgetResetScheduler {

    private final RedisTemplate<String, String> redisTemplate;
    private final BudgetRepository budgetRepository;

    // Runs at midnight on the 1st of every month
    @Scheduled(cron = "0 0 0 1 * *")
    public void clearPreviousMonthRedisKeys() {
        LocalDate prevMonth = LocalDate.now().minusMonths(1);
        int month = prevMonth.getMonthValue();
        int year = prevMonth.getYear();

        String pattern = String.format("budget:*:*:%d:%d", month, year);
        try {
            Set<String> keys = redisTemplate.keys(pattern);
            if (keys != null && !keys.isEmpty()) {
                redisTemplate.delete(keys);
                log.info("BudgetReset: cleared {} Redis counters for {}/{}", keys.size(), month, year);
            } else {
                log.info("BudgetReset: no Redis keys to clear for {}/{}", month, year);
            }
        } catch (Exception ex) {
            log.warn("BudgetReset: Redis cleanup failed — {}", ex.getMessage());
        }

        int budgetCount = budgetRepository.findByMonthAndYear(month, year).size();
        log.info("BudgetReset complete: {}/{} had {} budget records (historical data preserved)", month, year, budgetCount);
    }
}
