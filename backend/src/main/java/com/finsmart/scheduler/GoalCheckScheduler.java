package com.finsmart.scheduler;

import com.finsmart.entity.Goal;
import com.finsmart.entity.User;
import com.finsmart.repository.GoalRepository;
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
public class GoalCheckScheduler {

    private final GoalRepository goalRepository;
    private final EmailService emailService;

    // Runs every day at 9:00 AM
    @Scheduled(cron = "0 0 9 * * *")
    @Transactional
    public void checkOverdueGoals() {
        LocalDate today = LocalDate.now();
        List<Goal> overdueGoals = goalRepository.findByStatusAndDeadlineBefore(
                Goal.GoalStatus.IN_PROGRESS, today);

        if (overdueGoals.isEmpty()) {
            return;
        }

        for (Goal goal : overdueGoals) {
            goal.setStatus(Goal.GoalStatus.PAUSED);
            goalRepository.save(goal);

            User user = goal.getUser();
            if (user.getEmail() != null && !user.getEmail().isBlank() && user.isEmailAlerts()) {
                emailService.sendGoalDeadlineAlert(
                        user.getEmail(),
                        goal.getName(),
                        goal.getTargetAmount().doubleValue(),
                        goal.getSavedAmount().doubleValue(),
                        goal.getDeadline().toString()
                );
            }
            log.info("GoalCheck: goal '{}' (id={}) overdue for user '{}' — set to PAUSED",
                    goal.getName(), goal.getId(), user.getUsername());
        }

        log.info("GoalCheck complete: {} overdue goals paused", overdueGoals.size());
    }
}
