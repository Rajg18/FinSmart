package com.finsmart.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Value("${app.base-url:http://localhost:8080/api/v1}")
    private String baseUrl;

    public void sendVerificationEmail(String toEmail, String token) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject("FinSmart — Verify your email address");
            message.setText(
                    "Welcome to FinSmart!\n\n" +
                    "Click the link below to verify your email and activate your account:\n\n" +
                    baseUrl + "/auth/verify?token=" + token + "\n\n" +
                    "This link is valid for 24 hours.\n\n" +
                    "If you did not create a FinSmart account, ignore this email.\n\n" +
                    "FinSmart"
            );
            mailSender.send(message);
            log.info("Verification email sent to {}", toEmail);
        } catch (Exception ex) {
            log.warn("Verification email failed: {}", ex.getMessage());
        }
    }

    public void sendBudgetAlert(String toEmail, String category, double percentage, double spent, double limit) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject(String.format("FinSmart Alert: %s budget at %.0f%%", category, percentage));
            message.setText(String.format(
                    "Hi,\n\nYour %s budget has reached %.0f%%.\n\nSpent: ₹%.2f\nLimit: ₹%.2f\nRemaining: ₹%.2f\n\nStay on track!\n\nFinSmart",
                    category, percentage, spent, limit, limit - spent
            ));
            mailSender.send(message);
            log.info("Budget alert email sent to {}", toEmail);
        } catch (Exception ex) {
            log.warn("Email send failed (SMTP not configured): {}", ex.getMessage());
        }
    }

    public void sendMonthlyReport(String toEmail, String name, String reportContent) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject("FinSmart Monthly Report");
            message.setText("Hi " + name + ",\n\n" + reportContent + "\n\nFinSmart");
            mailSender.send(message);
            log.info("Monthly report sent to {}", toEmail);
        } catch (Exception ex) {
            log.warn("Monthly report email failed: {}", ex.getMessage());
        }
    }

    public void sendGoalDeadlineAlert(String toEmail, String goalName, double target, double saved, String deadline) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject("FinSmart: Goal deadline passed — " + goalName);
            message.setText(String.format(
                    "Hi,\n\nYour goal '%s' passed its deadline of %s.\n\nTarget: ₹%.2f\nSaved: ₹%.2f\nRemaining: ₹%.2f\n\nThe goal has been paused. You can resume it anytime.\n\nFinSmart",
                    goalName, deadline, target, saved, target - saved
            ));
            mailSender.send(message);
            log.info("Goal deadline alert sent to {}", toEmail);
        } catch (Exception ex) {
            log.warn("Goal deadline alert email failed: {}", ex.getMessage());
        }
    }

    public void sendSubscriptionReminder(String toEmail, String subscriptionName, double amount, String renewalDate) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(toEmail);
            message.setSubject("FinSmart: " + subscriptionName + " renews soon");
            message.setText(String.format(
                    "Hi,\n\nYour %s subscription renews on %s for ₹%.2f.\n\nFinSmart",
                    subscriptionName, renewalDate, amount
            ));
            mailSender.send(message);
        } catch (Exception ex) {
            log.warn("Subscription reminder email failed: {}", ex.getMessage());
        }
    }
}
