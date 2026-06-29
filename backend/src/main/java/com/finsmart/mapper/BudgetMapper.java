package com.finsmart.mapper;

import com.finsmart.dto.response.BudgetResponse;
import com.finsmart.entity.Budget;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface BudgetMapper {

    @Mapping(target = "remainingAmount", expression = "java(budget.getLimitAmount().subtract(budget.getSpentAmount()).max(java.math.BigDecimal.ZERO))")
    @Mapping(target = "percentageUsed", expression = "java(budget.getLimitAmount().compareTo(java.math.BigDecimal.ZERO) == 0 ? 0 : budget.getSpentAmount().divide(budget.getLimitAmount(), 4, java.math.RoundingMode.HALF_UP).multiply(new java.math.BigDecimal(\"100\")).doubleValue())")
    BudgetResponse toResponse(Budget budget);
}
