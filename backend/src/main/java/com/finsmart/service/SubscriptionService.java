package com.finsmart.service;

import com.finsmart.dto.request.SubscriptionRequest;
import com.finsmart.dto.response.SubscriptionResponse;
import com.finsmart.dto.response.SubscriptionSummaryResponse;
import com.finsmart.entity.Subscription;
import com.finsmart.entity.User;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.mapper.SubscriptionMapper;
import com.finsmart.repository.SubscriptionRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class SubscriptionService {

    private final SubscriptionRepository subscriptionRepository;
    private final UserRepository userRepository;
    private final SubscriptionMapper subscriptionMapper;

    @Transactional
    public SubscriptionResponse create(String username, SubscriptionRequest request) {
        User user = findUser(username);

        Subscription subscription = Subscription.builder()
                .user(user)
                .name(request.name())
                .amount(request.amount())
                .billingCycle(request.billingCycle())
                .startDate(request.startDate())
                .endDate(request.endDate())
                .renewalDate(calculateNextRenewalDate(request.startDate(), request.billingCycle()))
                .active(true)
                .build();

        Subscription saved = subscriptionRepository.save(subscription);
        log.info("Subscription created: {} for user {}", saved.getName(), username);
        return subscriptionMapper.toResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<SubscriptionResponse> getAll(String username, boolean activeOnly) {
        User user = findUser(username);
        List<Subscription> subscriptions = activeOnly
                ? subscriptionRepository.findByUserIdAndActiveTrue(user.getId())
                : subscriptionRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
        return subscriptions.stream().map(subscriptionMapper::toResponse).toList();
    }

    @Transactional(readOnly = true)
    public SubscriptionSummaryResponse getSummary(String username) {
        User user = findUser(username);
        List<Subscription> active = subscriptionRepository.findByUserIdAndActiveTrue(user.getId());

        List<SubscriptionResponse> responses = active.stream()
                .map(subscriptionMapper::toResponse)
                .toList();

        BigDecimal totalMonthly = responses.stream()
                .map(SubscriptionResponse::monthlyEquivalent)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return new SubscriptionSummaryResponse(responses, responses.size(), totalMonthly);
    }

    @Transactional(readOnly = true)
    public SubscriptionResponse getById(String username, Long id) {
        User user = findUser(username);
        return subscriptionMapper.toResponse(findSubscription(id, user.getId()));
    }

    @Transactional
    public SubscriptionResponse update(String username, Long id, SubscriptionRequest request) {
        User user = findUser(username);
        Subscription subscription = findSubscription(id, user.getId());

        subscription.setName(request.name());
        subscription.setAmount(request.amount());
        subscription.setBillingCycle(request.billingCycle());
        subscription.setStartDate(request.startDate());
        subscription.setEndDate(request.endDate());
        subscription.setRenewalDate(calculateNextRenewalDate(request.startDate(), request.billingCycle()));

        return subscriptionMapper.toResponse(subscriptionRepository.save(subscription));
    }

    @Transactional
    public SubscriptionResponse toggle(String username, Long id) {
        User user = findUser(username);
        Subscription subscription = findSubscription(id, user.getId());

        subscription.setActive(!subscription.isActive());
        log.info("Subscription '{}' toggled to active={} for user {}", subscription.getName(), subscription.isActive(), username);
        return subscriptionMapper.toResponse(subscriptionRepository.save(subscription));
    }

    @Transactional
    public void delete(String username, Long id) {
        User user = findUser(username);
        Subscription subscription = findSubscription(id, user.getId());
        subscriptionRepository.delete(subscription);
    }

    private LocalDate calculateNextRenewalDate(LocalDate startDate, Subscription.BillingCycle cycle) {
        LocalDate next = startDate;
        LocalDate today = LocalDate.now();
        while (!next.isAfter(today)) {
            next = switch (cycle) {
                case MONTHLY -> next.plusMonths(1);
                case QUARTERLY -> next.plusMonths(3);
                case YEARLY -> next.plusYears(1);
            };
        }
        return next;
    }

    private Subscription findSubscription(Long id, Long userId) {
        return subscriptionRepository.findByIdAndUserId(id, userId)
                .orElseThrow(() -> new ResourceNotFoundException("Subscription not found: " + id));
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
