package com.finsmart.repository;

import com.finsmart.entity.Transaction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    Page<Transaction> findByUserIdAndDeletedFalseOrderByTransactionDateDesc(Long userId, Pageable pageable);

    Page<Transaction> findByUserIdAndTypeAndDeletedFalseOrderByTransactionDateDesc(
            Long userId, Transaction.TransactionType type, Pageable pageable);

    Page<Transaction> findByUserIdAndCategoryAndDeletedFalseOrderByTransactionDateDesc(
            Long userId, Transaction.Category category, Pageable pageable);

    Optional<Transaction> findByIdAndUserIdAndDeletedFalse(Long id, Long userId);

    List<Transaction> findTop10ByUserIdAndDeletedFalseOrderByTransactionDateDesc(Long userId);

    @Query("""
        SELECT COALESCE(SUM(t.amount), 0)
        FROM Transaction t
        WHERE t.user.id = :userId
        AND t.type = :type
        AND t.deleted = false
        AND t.transactionDate >= :from
        AND t.transactionDate < :to
        """)
    BigDecimal sumByUserAndTypeAndDateRange(
            @Param("userId") Long userId,
            @Param("type") Transaction.TransactionType type,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to);

    @Query("""
        SELECT COALESCE(SUM(t.amount), 0)
        FROM Transaction t
        WHERE t.user.id = :userId
        AND t.category = :category
        AND t.type = 'DEBIT'
        AND t.deleted = false
        AND t.transactionDate >= :from
        AND t.transactionDate < :to
        """)
    BigDecimal sumByUserAndCategoryAndDateRange(
            @Param("userId") Long userId,
            @Param("category") Transaction.Category category,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to);

    @Query("""
        SELECT t.category, COALESCE(SUM(t.amount), 0)
        FROM Transaction t
        WHERE t.user.id = :userId
        AND t.type = 'DEBIT'
        AND t.deleted = false
        AND t.transactionDate >= :from
        AND t.transactionDate < :to
        GROUP BY t.category
        """)
    List<Object[]> sumByCategory(
            @Param("userId") Long userId,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to);

    @Query("""
        SELECT COUNT(t)
        FROM Transaction t
        WHERE t.user.id = :userId
        AND t.type = 'DEBIT'
        AND t.deleted = false
        AND t.transactionDate >= :from
        AND t.transactionDate < :to
        """)
    long countDebitsInRange(
            @Param("userId") Long userId,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to);

    @Query("""
        SELECT t.merchant, COALESCE(SUM(t.amount), 0), COUNT(t)
        FROM Transaction t
        WHERE t.user.id = :userId
        AND t.type = 'DEBIT'
        AND t.deleted = false
        AND t.transactionDate >= :from
        AND t.transactionDate < :to
        GROUP BY t.merchant
        ORDER BY SUM(t.amount) DESC
        """)
    List<Object[]> findTopMerchants(
            @Param("userId") Long userId,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            Pageable pageable);

    @Query("""
        SELECT t FROM Transaction t
        WHERE t.user.id = :userId
        AND t.category = com.finsmart.entity.Transaction.Category.INCOME
        AND t.type = com.finsmart.entity.Transaction.TransactionType.CREDIT
        AND t.deleted = false
        AND t.transactionDate >= :from
        AND t.transactionDate < :to
        ORDER BY t.amount DESC
        """)
    List<Transaction> findIncomeCreditsInRange(
            @Param("userId") Long userId,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            Pageable pageable);

    @Modifying
    void deleteByUserId(Long userId);
}
