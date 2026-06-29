package com.finsmart.service;

import com.finsmart.dto.request.LoginRequest;
import com.finsmart.dto.request.RegisterRequest;
import com.finsmart.dto.response.AuthResponse;
import com.finsmart.entity.User;
import com.finsmart.exception.BusinessException;
import com.finsmart.exception.ConflictException;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.exception.UnauthorizedException;
import com.finsmart.repository.BudgetRepository;
import com.finsmart.repository.GoalRepository;
import com.finsmart.repository.SubscriptionRepository;
import com.finsmart.repository.TransactionRepository;
import com.finsmart.repository.UserRepository;
import com.finsmart.security.JwtUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final UserRepository userRepository;
    private final TransactionRepository transactionRepository;
    private final BudgetRepository budgetRepository;
    private final GoalRepository goalRepository;
    private final SubscriptionRepository subscriptionRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final EmailService emailService;

    @Value("${app.demo.username}")
    private String demoUsername;

    @Value("${app.demo.password}")
    private String demoPassword;

    @Value("${app.demo.name}")
    private String demoName;

    @Transactional
    public void register(RegisterRequest request) {
        if (userRepository.existsByUsername(request.username())) {
            throw new ConflictException("Username '" + request.username() + "' is already taken");
        }

        if (userRepository.existsByEmail(request.email())) {
            throw new ConflictException("Email is already registered");
        }

        String verificationToken = UUID.randomUUID().toString();

        User user = User.builder()
                .name(request.username())
                .username(request.username())
                .email(request.email())
                .password(passwordEncoder.encode(request.password()))
                .emailAlerts(true)
                .verified(false)
                .verificationToken(verificationToken)
                .role(User.Role.USER)
                .build();

        userRepository.save(user);
        emailService.sendVerificationEmail(request.email(), verificationToken);
        log.info("New user registered (pending verification): {}", request.username());
    }

    @Transactional
    public AuthResponse verifyEmail(String token) {
        User user = userRepository.findByVerificationToken(token)
                .orElseThrow(() -> new ResourceNotFoundException("Invalid or expired verification link"));

        user.setVerified(true);
        user.setVerificationToken(null);
        userRepository.save(user);
        log.info("Email verified for user: {}", user.getUsername());

        String jwt = jwtUtil.generateToken(user.getUsername());
        return new AuthResponse(jwt, user.getUsername(), user.getName(), user.isEmailAlerts(), user.getRole().name());
    }

    public AuthResponse login(LoginRequest request) {
        if (demoUsername.equals(request.username()) && demoPassword.equals(request.password())) {
            return loginDemo();
        }

        User user = userRepository.findByUsername(request.username())
                .orElseThrow(() -> new UnauthorizedException("Invalid username or password"));

        if (!passwordEncoder.matches(request.password(), user.getPassword())) {
            throw new UnauthorizedException("Invalid username or password");
        }

        if (!user.isVerified()) {
            throw new BusinessException("Please verify your email before logging in. Check your inbox for the verification link.");
        }

        String token = jwtUtil.generateToken(user.getUsername());
        return new AuthResponse(token, user.getUsername(), user.getName(), user.isEmailAlerts(), user.getRole().name());
    }

    @Transactional
    public AuthResponse loginDemo() {
        String uniqueUsername = "demo_" + UUID.randomUUID().toString().replace("-", "").substring(0, 10);
        User demoUser = User.builder()
                .name(demoName)
                .username(uniqueUsername)
                .password(passwordEncoder.encode(demoPassword))
                .emailAlerts(false)
                .role(User.Role.DEMO)
                .build();
        userRepository.save(demoUser);
        log.info("Demo session created: {}", uniqueUsername);

        String token = jwtUtil.generateToken(demoUser.getUsername());
        return new AuthResponse(token, demoUser.getUsername(), demoUser.getName(), false, User.Role.DEMO.name());
    }

    @Transactional
    public void logout(String username) {
        userRepository.findByUsername(username).ifPresent(user -> {
            if (user.getRole() == User.Role.DEMO) {
                transactionRepository.deleteByUserId(user.getId());
                budgetRepository.deleteByUserId(user.getId());
                goalRepository.deleteByUserId(user.getId());
                subscriptionRepository.deleteByUserId(user.getId());
                userRepository.delete(user);
                log.info("Demo session cleaned up: {}", username);
            }
        });
    }
}
