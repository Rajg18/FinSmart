package com.finsmart.repository;

import com.finsmart.entity.Budget;
import com.finsmart.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BudgetRepository extends JpaRepository<Budget, Long> {

    List<Budget> findByUserIdAndMonthAndYear(Long userId, Integer month, Integer year);

    Optional<Budget> findByUserIdAndCategoryAndMonthAndYear(
            Long userId, Transaction.Category category, Integer month, Integer year);

    Optional<Budget> findByIdAndUserId(Long id, Long userId);

    List<Budget> findByMonthAndYear(Integer month, Integer year);

    void deleteByUserId(Long userId);
}
