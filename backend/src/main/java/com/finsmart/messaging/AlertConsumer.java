package com.finsmart.messaging;

import com.finsmart.service.EmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class AlertConsumer {

    private final EmailService emailService;

    @RabbitListener(queues = "${app.rabbitmq.queue}", autoStartup = "true")
    public void consume(AlertMessage message) {
        log.info("Processing alert: {} for user {}", message.alertType(), message.username());

        if (message.email() != null && !message.email().isBlank()) {
            emailService.sendBudgetAlert(
                    message.email(),
                    message.category(),
                    message.percentageUsed(),
                    message.spentAmount(),
                    message.limitAmount()
            );
        } else {
            log.info("No email for user {} — alert logged only", message.username());
        }
    }
}
