package com.finsmart.batch;

import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

@Component
@RequiredArgsConstructor
@Slf4j
public class MonthlyReportProcessor implements ItemProcessor<User, MonthlyReportData> {

    private final TransactionRepository transactionRepository;

    @Override
    public MonthlyReportData process(User user) {
        LocalDate prev = LocalDate.now().minusMonths(1);
        LocalDateTime from = prev.withDayOfMonth(1).atStartOfDay();
        LocalDateTime to = prev.plusMonths(1).withDayOfMonth(1).atStartOfDay();
        Long userId = user.getId();

        BigDecimal totalIncome = transactionRepository.sumByUserAndTypeAndDateRange(
                userId, Transaction.TransactionType.CREDIT, from, to);
        BigDecimal totalSpent = transactionRepository.sumByUserAndTypeAndDateRange(
                userId, Transaction.TransactionType.DEBIT, from, to);
        BigDecimal netSavings = totalIncome.subtract(totalSpent);
        long txnCount = transactionRepository.countDebitsInRange(userId, from, to);

        List<Object[]> categories = transactionRepository.sumByCategory(userId, from, to);
        String topCategory = categories.isEmpty() ? "N/A"
                : categories.stream()
                        .max(Comparator.comparing(r -> (BigDecimal) r[1]))
                        .map(r -> ((Transaction.Category) r[0]).name())
                        .orElse("N/A");

        String monthName = prev.getMonth().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
        String reportContent = String.format(
                "Monthly Summary — %s %d%n%n" +
                "Total Income:     ₹%.2f%n" +
                "Total Spent:      ₹%.2f%n" +
                "Net Savings:      ₹%.2f%n" +
                "Transactions:     %d%n" +
                "Top Category:     %s%n%n" +
                "Log in to FinSmart to see the full breakdown.",
                monthName, prev.getYear(),
                totalIncome.doubleValue(), totalSpent.doubleValue(),
                netSavings.doubleValue(), txnCount, topCategory
        );

        log.info("Report prepared for user {} ({}/{})", user.getUsername(), prev.getMonthValue(), prev.getYear());
        return new MonthlyReportData(userId, user.getEmail(), user.getName(),
                prev.getMonthValue(), prev.getYear(),
                totalIncome, totalSpent, netSavings, txnCount, topCategory, reportContent);
    }
}
