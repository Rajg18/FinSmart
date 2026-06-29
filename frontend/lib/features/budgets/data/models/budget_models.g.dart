// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetRequestImpl _$$BudgetRequestImplFromJson(Map<String, dynamic> json) =>
    _$BudgetRequestImpl(
      category: json['category'] as String,
      limitAmount: (json['limitAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetRequestImplToJson(_$BudgetRequestImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'limitAmount': instance.limitAmount,
    };

_$BudgetResponseImpl _$$BudgetResponseImplFromJson(Map<String, dynamic> json) =>
    _$BudgetResponseImpl(
      id: (json['id'] as num).toInt(),
      category: json['category'] as String,
      limitAmount: (json['limitAmount'] as num).toDouble(),
      spentAmount: (json['spentAmount'] as num).toDouble(),
      remainingAmount: (json['remainingAmount'] as num).toDouble(),
      percentageUsed: (json['percentageUsed'] as num).toDouble(),
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      alert50Sent: json['alert50Sent'] as bool,
      alert80Sent: json['alert80Sent'] as bool,
      alert100Sent: json['alert100Sent'] as bool,
    );

Map<String, dynamic> _$$BudgetResponseImplToJson(
  _$BudgetResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'limitAmount': instance.limitAmount,
  'spentAmount': instance.spentAmount,
  'remainingAmount': instance.remainingAmount,
  'percentageUsed': instance.percentageUsed,
  'month': instance.month,
  'year': instance.year,
  'alert50Sent': instance.alert50Sent,
  'alert80Sent': instance.alert80Sent,
  'alert100Sent': instance.alert100Sent,
};
