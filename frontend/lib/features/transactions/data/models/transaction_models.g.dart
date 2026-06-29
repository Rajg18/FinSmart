// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionRequestImpl _$$TransactionRequestImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionRequestImpl(
  merchant: json['merchant'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: json['type'] as String,
  category: json['category'] as String,
  paymentMethod: json['paymentMethod'] as String?,
  transactionDate: json['transactionDate'] as String?,
);

Map<String, dynamic> _$$TransactionRequestImplToJson(
  _$TransactionRequestImpl instance,
) => <String, dynamic>{
  'merchant': instance.merchant,
  'amount': instance.amount,
  'type': instance.type,
  'category': instance.category,
  'paymentMethod': instance.paymentMethod,
  'transactionDate': instance.transactionDate,
};

_$TransactionItemImpl _$$TransactionItemImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionItemImpl(
  id: (json['id'] as num).toInt(),
  merchant: json['merchant'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: json['type'] as String,
  category: json['category'] as String,
  paymentMethod: json['paymentMethod'] as String?,
  source: json['source'] as String?,
  transactionDate: json['transactionDate'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$TransactionItemImplToJson(
  _$TransactionItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'merchant': instance.merchant,
  'amount': instance.amount,
  'type': instance.type,
  'category': instance.category,
  'paymentMethod': instance.paymentMethod,
  'source': instance.source,
  'transactionDate': instance.transactionDate,
  'createdAt': instance.createdAt,
};

_$TransactionPageImpl _$$TransactionPageImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionPageImpl(
  content: (json['content'] as List<dynamic>)
      .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  last: json['last'] as bool,
);

Map<String, dynamic> _$$TransactionPageImplToJson(
  _$TransactionPageImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'number': instance.number,
  'last': instance.last,
};
