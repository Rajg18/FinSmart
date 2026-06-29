package com.finsmart.service;

import com.finsmart.dto.response.CategoryBreakdownResponse;
import com.finsmart.dto.response.MonthlyComparisonResponse;
import com.finsmart.dto.response.SpendingTrendResponse;
import com.finsmart.dto.response.TopMerchantsResponse;
import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.repository.TransactionRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AnalyticsService {

    private final TransactionRepository transactionRepository;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public CategoryBreakdownResponse getCategoryBreakdown(String username, int month, int year) {
        Long userId = findUser(username).getId();
        LocalDateTime from = LocalDateTime.of(year, month, 1, 0, 0);
        LocalDateTime to = from.plusMonths(1);

        List<Object[]> raw = transactionRepository.sumByCategory(userId, from, to);

        BigDecimal total = raw.stream()
                .map(r -> (BigDecimal) r[1])
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        List<CategoryBreakdownResponse.CategoryBreakdownItem> breakdown = raw.stream()
                .map(r -> {
                    Transaction.Category cat = (Transaction.Category) r[0];
                    BigDecimal amount = (BigDecimal) r[1];
                    double pct = total.compareTo(BigDecimal.ZERO) == 0 ? 0.0
                            : amount.divide(total, 4, RoundingMode.HALF_UP)
                                    .multiply(BigDecimal.valueOf(100))
                                    .doubleValue();
                    return new CategoryBreakdownResponse.CategoryBreakdownItem(cat, amount, pct);
                })
                .sorted(Comparator.comparing(CategoryBreakdownResponse.CategoryBreakdownItem::amount).reversed())
                .toList();

        return new CategoryBreakdownResponse(month, year, total, breakdown);
    }

    @Transactional(readOnly = true)
    public MonthlyComparisonResponse getMonthlyComparison(String username,
            int month1, int year1, int month2, int year2) {
        Long userId = findUser(username).getId();
        MonthlyComparisonResponse.MonthSummary p1 = buildMonthSummary(userId, month1, year1);
        MonthlyComparisonResponse.MonthSummary p2 = buildMonthSummary(userId, month2, year2);

        BigDecimal diff = p2.totalSpent().subtract(p1.totalSpent());
        double changePct = p1.totalSpent().compareTo(BigDecimal.ZERO) == 0 ? 0.0
                : diff.divide(p1.totalSpent(), 4, RoundingMode.HALF_UP)
                        .multiply(BigDecimal.valueOf(100))
                        .doubleValue();

        return new MonthlyComparisonResponse(p1, p2, diff, changePct);
    }

    @Transactional(readOnly = true)
    public SpendingTrendResponse getSpendingTrend(String username, int months) {
        Long userId = findUser(username).getId();
        LocalDate cursor = LocalDate.now().withDayOfMonth(1);

        List<SpendingTrendResponse.MonthlyPoint> trend = new ArrayList<>();
        for (int i = months - 1; i >= 0; i--) {
            LocalDate point = cursor.minusMonths(i);
            LocalDateTime from = point.atStartOfDay();
            LocalDateTime to = point.plusMonths(1).atStartOfDay();

            BigDecimal spent = transactionRepository.sumByUserAndTypeAndDateRange(
                    userId, Transaction.TransactionType.DEBIT, from, to);
            BigDecimal income = transactionRepository.sumByUserAndTypeAndDateRange(
                    userId, Transaction.TransactionType.CREDIT, from, to);

            trend.add(new SpendingTrendResponse.MonthlyPoint(
                    point.getMonthValue(), point.getYear(), spent, income));
        }

        return new SpendingTrendResponse(trend);
    }

    @Transactional(readOnly = true)
    public TopMerchantsResponse getTopMerchants(String username, int month, int year, int limit) {
        Long userId = findUser(username).getId();
        LocalDateTime from = LocalDateTime.of(year, month, 1, 0, 0);
        LocalDateTime to = from.plusMonths(1);

        List<Object[]> raw = transactionRepository.findTopMerchants(
                userId, from, to, PageRequest.of(0, limit));

        List<TopMerchantsResponse.MerchantStat> merchants = raw.stream()
                .map(r -> new TopMerchantsResponse.MerchantStat(
                        (String) r[0],
                        (BigDecimal) r[1],
                        (Long) r[2]))
                .toList();

        return new TopMerchantsResponse(month, year, merchants);
    }

    private MonthlyComparisonResponse.MonthSummary buildMonthSummary(Long userId, int month, int year) {
        LocalDateTime from = LocalDateTime.of(year, month, 1, 0, 0);
        LocalDateTime to = from.plusMonths(1);

        BigDecimal spent = transactionRepository.sumByUserAndTypeAndDateRange(
                userId, Transaction.TransactionType.DEBIT, from, to);
        BigDecimal income = transactionRepository.sumByUserAndTypeAndDateRange(
                userId, Transaction.TransactionType.CREDIT, from, to);
        long count = transactionRepository.countDebitsInRange(userId, from, to);

        return new MonthlyComparisonResponse.MonthSummary(month, year, spent, income, count);
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
