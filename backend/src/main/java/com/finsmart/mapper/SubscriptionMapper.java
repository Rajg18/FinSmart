package com.finsmart.mapper;

import com.finsmart.dto.response.SubscriptionResponse;
import com.finsmart.entity.Subscription;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Mapper(componentModel = "spring")
public interface SubscriptionMapper {

    @Mapping(target = "monthlyEquivalent", expression = "java(monthlyEquivalent(subscription))")
    SubscriptionResponse toResponse(Subscription subscription);

    default BigDecimal monthlyEquivalent(Subscription subscription) {
        return switch (subscription.getBillingCycle()) {
            case MONTHLY -> subscription.getAmount();
            case QUARTERLY -> subscription.getAmount().divide(BigDecimal.valueOf(3), 2, RoundingMode.HALF_UP);
            case YEARLY -> subscription.getAmount().divide(BigDecimal.valueOf(12), 2, RoundingMode.HALF_UP);
        };
    }
}
