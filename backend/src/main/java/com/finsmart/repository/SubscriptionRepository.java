package com.finsmart.repository;

import com.finsmart.entity.Subscription;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {

    List<Subscription> findByUserIdAndActiveTrue(Long userId);

    List<Subscription> findByUserIdOrderByCreatedAtDesc(Long userId);

    Optional<Subscription> findByIdAndUserId(Long id, Long userId);

    List<Subscription> findByActiveTrueAndRenewalDateBetween(LocalDate from, LocalDate to);

    void deleteByUserId(Long userId);
}
