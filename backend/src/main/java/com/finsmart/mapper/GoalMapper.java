package com.finsmart.mapper;

import com.finsmart.dto.response.GoalResponse;
import com.finsmart.entity.Goal;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface GoalMapper {

    @Mapping(target = "remainingAmount", expression = "java(goal.getTargetAmount().subtract(goal.getSavedAmount()).max(java.math.BigDecimal.ZERO))")
    @Mapping(target = "progressPercent", expression = "java(goal.getTargetAmount().compareTo(java.math.BigDecimal.ZERO) == 0 ? 0 : goal.getSavedAmount().divide(goal.getTargetAmount(), 4, java.math.RoundingMode.HALF_UP).multiply(new java.math.BigDecimal(\"100\")).doubleValue())")
    GoalResponse toResponse(Goal goal);
}
