package com.finsmart.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(
    name = "budgets",
    uniqueConstraints = @UniqueConstraint(
        name = "uk_budget_user_category_month_year",
        columnNames = {"user_id", "category", "month", "year"}
    )
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Budget {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Transaction.Category category;

    @Column(name = "limit_amount", nullable = false, precision = 15, scale = 2)
    private BigDecimal limitAmount;

    @Column(name = "spent_amount", nullable = false, precision = 15, scale = 2)
    @Builder.Default
    private BigDecimal spentAmount = BigDecimal.ZERO;

    @Column(nullable = false)
    private Integer month;

    @Column(nullable = false)
    private Integer year;

    @Column(name = "alert_50_sent", nullable = false)
    @Builder.Default
    private boolean alert50Sent = false;

    @Column(name = "alert_80_sent", nullable = false)
    @Builder.Default
    private boolean alert80Sent = false;

    @Column(name = "alert_100_sent", nullable = false)
    @Builder.Default
    private boolean alert100Sent = false;
}
