package com.finsmart.service;

import com.finsmart.dto.request.TransactionRequest;
import com.finsmart.dto.response.TransactionResponse;
import com.finsmart.entity.Transaction;
import com.finsmart.entity.User;
import com.finsmart.exception.ResourceNotFoundException;
import com.finsmart.mapper.TransactionMapper;
import com.finsmart.repository.TransactionRepository;
import com.finsmart.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Slf4j
public class TransactionService {

    private final TransactionRepository transactionRepository;
    private final UserRepository userRepository;
    private final TransactionMapper transactionMapper;
    private final BudgetService budgetService;

    @Transactional
    public TransactionResponse create(String username, TransactionRequest request) {
        User user = findUser(username);

        LocalDateTime txDate = request.transactionDate() != null
                ? request.transactionDate()
                : LocalDateTime.now();

        Transaction transaction = Transaction.builder()
                .user(user)
                .merchant(request.merchant())
                .amount(request.amount())
                .type(request.type())
                .category(request.category())
                .paymentMethod(request.paymentMethod())
                .source(Transaction.TransactionSource.MANUAL)
                .transactionDate(txDate)
                .build();

        Transaction saved = transactionRepository.save(transaction);

        if (saved.getType() == Transaction.TransactionType.DEBIT) {
            budgetService.recordSpending(user, saved.getCategory(), saved.getAmount());
        }

        log.info("Transaction created: {} for user {}", saved.getId(), username);
        return transactionMapper.toResponse(saved);
    }

    @Transactional(readOnly = true)
    public Page<TransactionResponse> getAll(String username, Transaction.TransactionType type,
                                            Transaction.Category category, Pageable pageable) {
        User user = findUser(username);

        if (type != null) {
            return transactionRepository
                    .findByUserIdAndTypeAndDeletedFalseOrderByTransactionDateDesc(user.getId(), type, pageable)
                    .map(transactionMapper::toResponse);
        }

        if (category != null) {
            return transactionRepository
                    .findByUserIdAndCategoryAndDeletedFalseOrderByTransactionDateDesc(user.getId(), category, pageable)
                    .map(transactionMapper::toResponse);
        }

        return transactionRepository
                .findByUserIdAndDeletedFalseOrderByTransactionDateDesc(user.getId(), pageable)
                .map(transactionMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public TransactionResponse getById(String username, Long transactionId) {
        User user = findUser(username);
        Transaction transaction = transactionRepository
                .findByIdAndUserIdAndDeletedFalse(transactionId, user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Transaction not found: " + transactionId));
        return transactionMapper.toResponse(transaction);
    }

    @Transactional
    public TransactionResponse update(String username, Long transactionId, TransactionRequest request) {
        User user = findUser(username);
        Transaction transaction = transactionRepository
                .findByIdAndUserIdAndDeletedFalse(transactionId, user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Transaction not found: " + transactionId));

        transaction.setMerchant(request.merchant());
        transaction.setAmount(request.amount());
        transaction.setType(request.type());
        transaction.setCategory(request.category());
        transaction.setPaymentMethod(request.paymentMethod());
        if (request.transactionDate() != null) {
            transaction.setTransactionDate(request.transactionDate());
        }

        return transactionMapper.toResponse(transactionRepository.save(transaction));
    }

    @Transactional
    public void softDelete(String username, Long transactionId) {
        User user = findUser(username);
        Transaction transaction = transactionRepository
                .findByIdAndUserIdAndDeletedFalse(transactionId, user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Transaction not found: " + transactionId));
        transaction.setDeleted(true);
        transactionRepository.save(transaction);
        log.info("Transaction soft-deleted: {} for user {}", transactionId, username);
    }

    private User findUser(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
    }
}
