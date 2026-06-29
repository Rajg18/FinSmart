package com.finsmart.service;

import com.finsmart.dto.response.BankFeedResponse;
import com.finsmart.dto.response.TransactionResponse;
import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.exception.BusinessException;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.mapper.TransactionMapper;
import com.finsmart.repository.TransactionRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
@RequiredArgsConstructor
@Slf4j
public class MockBankFeedService {

    private final UserRepository userRepository;
    private final TransactionRepository transactionRepository;
    private final TransactionMapper transactionMapper;

    @Value("${app.bank-feed.slot-interval-hours:6}")
    private int slotIntervalHours;

    private static final Random RANDOM = new Random();

    private static final List<Transaction.Category> WEIGHTED_CATEGORIES = List.of(
            Transaction.Category.FOOD, Transaction.Category.FOOD, Transaction.Category.FOOD,
            Transaction.Category.TRANSPORT, Transaction.Category.TRANSPORT,
            Transaction.Category.GROCERIES, Transaction.Category.GROCERIES,
            Transaction.Category.ENTERTAINMENT, Transaction.Category.SHOPPING,
            Transaction.Category.UTILITIES, Transaction.Category.HEALTHCARE,
            Transaction.Category.SUBSCRIPTION
    );

    private static final Map<Transaction.Category, String[]> MERCHANTS = Map.ofEntries(
            Map.entry(Transaction.Category.FOOD, new String[]{"Swiggy", "Zomato", "Dominos", "KFC", "McDonald's", "Burger King", "Cafe Coffee Day"}),
            Map.entry(Transaction.Category.TRANSPORT, new String[]{"Ola", "Uber", "Rapido", "IRCTC", "IndiGo", "Ola Electric"}),
            Map.entry(Transaction.Category.GROCERIES, new String[]{"BigBasket", "Blinkit", "DMart", "Reliance Fresh", "More Supermarket"}),
            Map.entry(Transaction.Category.ENTERTAINMENT, new String[]{"BookMyShow", "PVR Cinemas", "Inox", "Disney+ Hotstar"}),
            Map.entry(Transaction.Category.SHOPPING, new String[]{"Amazon", "Flipkart", "Myntra", "Meesho", "Nykaa"}),
            Map.entry(Transaction.Category.UTILITIES, new String[]{"Jio Postpaid", "Airtel", "BESCOM", "Tata Play"}),
            Map.entry(Transaction.Category.HEALTHCARE, new String[]{"Apollo Pharmacy", "Practo", "1mg", "Netmeds"}),
            Map.entry(Transaction.Category.SUBSCRIPTION, new String[]{"Netflix", "Spotify", "YouTube Premium", "Amazon Prime"})
    );

    private static final Map<Transaction.Category, int[]> AMOUNT_RANGES = Map.ofEntries(
            Map.entry(Transaction.Category.FOOD, new int[]{80, 600}),
            Map.entry(Transaction.Category.TRANSPORT, new int[]{50, 1500}),
            Map.entry(Transaction.Category.GROCERIES, new int[]{200, 3000}),
            Map.entry(Transaction.Category.ENTERTAINMENT, new int[]{200, 2000}),
            Map.entry(Transaction.Category.SHOPPING, new int[]{500, 5000}),
            Map.entry(Transaction.Category.UTILITIES, new int[]{300, 2000}),
            Map.entry(Transaction.Category.HEALTHCARE, new int[]{150, 3000}),
            Map.entry(Transaction.Category.SUBSCRIPTION, new int[]{100, 1000})
    );

    private static final List<String> PAYMENT_METHODS = List.of("UPI", "Credit Card", "Debit Card", "Net Banking");

    @Transactional
    public BankFeedResponse sync(String username) {
        User user = findUser(username);
        LocalDateTime now = LocalDateTime.now();

        if (user.getLastBankSync() != null &&
                user.getLastBankSync().isAfter(now.minusHours(slotIntervalHours))) {
            LocalDateTime nextSlot = user.getLastBankSync().plusHours(slotIntervalHours);
            throw new BusinessException("Bank sync cooldown active. Next slot available at: " + nextSlot);
        }

        int count = 5 + RANDOM.nextInt(4); // 5 to 8 transactions
        List<Transaction> generated = new ArrayList<>();

        for (int i = 0; i < count; i++) {
            Transaction.Category category = WEIGHTED_CATEGORIES.get(RANDOM.nextInt(WEIGHTED_CATEGORIES.size()));
            String[] merchantArr = MERCHANTS.getOrDefault(category, new String[]{"Local Store"});
            String merchant = merchantArr[RANDOM.nextInt(merchantArr.length)];

            int[] range = AMOUNT_RANGES.getOrDefault(category, new int[]{100, 1000});
            BigDecimal amount = BigDecimal.valueOf(range[0] + RANDOM.nextInt(range[1] - range[0]));

            String paymentMethod = PAYMENT_METHODS.get(RANDOM.nextInt(PAYMENT_METHODS.size()));
            LocalDateTime txDate = now.minusMinutes(RANDOM.nextInt(1440)); // spread over past 24h

            Transaction tx = Transaction.builder()
                    .user(user)
                    .merchant(merchant)
                    .amount(amount)
                    .type(Transaction.TransactionType.DEBIT)
                    .category(category)
                    .paymentMethod(paymentMethod)
                    .source(Transaction.TransactionSource.BANK_FEED)
                    .transactionDate(txDate)
                    .build();
            generated.add(transactionRepository.save(tx));
        }

        user.setLastBankSync(now);
        userRepository.save(user);
        log.info("Bank feed sync: {} transactions generated for user {}", count, username);

        List<TransactionResponse> responses = generated.stream()
                .map(transactionMapper::toResponse).toList();

        return new BankFeedResponse(count, responses, now, now.plusHours(slotIntervalHours));
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
