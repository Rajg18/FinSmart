package com.finsmart.repository;

import com.finsmart.entity.Goal;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface GoalRepository extends JpaRepository<Goal, Long> {

    List<Goal> findByUserIdOrderByPriorityAsc(Long userId);

    Optional<Goal> findByIdAndUserId(Long id, Long userId);

    List<Goal> findByUserIdAndStatusOrderByPriorityAsc(Long userId, Goal.GoalStatus status);

    List<Goal> findByStatusAndDeadlineBefore(Goal.GoalStatus status, LocalDate date);

    void deleteByUserId(Long userId);
}
