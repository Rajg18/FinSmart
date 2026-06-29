package com.finsmart.scheduler;

import com.finsmart.entity.Subscription;
import com.finsmart.entity.User;
import com.finsmart.repository.SubscriptionRepository;
import com.finsmart.service.EmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class SubscriptionReminderScheduler {

    private final SubscriptionRepository subscriptionRepository;
    private final EmailService emailService;

    // Runs every day at 8:00 AM — reminds users 3 days before renewal
    @Scheduled(cron = "0 0 8 * * *")
    @Transactional(readOnly = true)
    public void sendRenewalReminders() {
        LocalDate reminderDate = LocalDate.now().plusDays(3);

        List<Subscription> upcoming = subscriptionRepository
                .findByActiveTrueAndRenewalDateBetween(reminderDate, reminderDate);

        if (upcoming.isEmpty()) {
            return;
        }

        for (Subscription sub : upcoming) {
            User user = sub.getUser();
            if (user.getEmail() != null && !user.getEmail().isBlank() && user.isEmailAlerts()) {
                emailService.sendSubscriptionReminder(
                        user.getEmail(),
                        sub.getName(),
                        sub.getAmount().doubleValue(),
                        sub.getRenewalDate().toString()
                );
            }
            log.info("SubscriptionReminder: '{}' renews on {} for user '{}'",
                    sub.getName(), sub.getRenewalDate(), user.getUsername());
        }

        log.info("SubscriptionReminder complete: {} reminders sent", upcoming.size());
    }
}
