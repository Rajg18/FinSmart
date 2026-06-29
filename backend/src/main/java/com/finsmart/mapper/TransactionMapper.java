package com.finsmart.mapper;

import com.finsmart.dto.response.TransactionResponse;
import com.finsmart.entity.Transaction;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface TransactionMapper {

    TransactionResponse toResponse(Transaction transaction);
}
