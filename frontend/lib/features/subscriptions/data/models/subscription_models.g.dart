// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionRequestImpl _$$SubscriptionRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionRequestImpl(
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
  billingCycle: json['billingCycle'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
);

Map<String, dynamic> _$$SubscriptionRequestImplToJson(
  _$SubscriptionRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'amount': instance.amount,
  'billingCycle': instance.billingCycle,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
};

_$SubscriptionResponseImpl _$$SubscriptionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionResponseImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
  billingCycle: json['billingCycle'] as String,
  monthlyEquivalent: (json['monthlyEquivalent'] as num).toDouble(),
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
  renewalDate: json['renewalDate'] as String?,
  active: json['active'] as bool,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$SubscriptionResponseImplToJson(
  _$SubscriptionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
  'billingCycle': instance.billingCycle,
  'monthlyEquivalent': instance.monthlyEquivalent,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'renewalDate': instance.renewalDate,
  'active': instance.active,
  'createdAt': instance.createdAt,
};

_$SubscriptionSummaryResponseImpl _$$SubscriptionSummaryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionSummaryResponseImpl(
  subscriptions: (json['subscriptions'] as List<dynamic>)
      .map((e) => SubscriptionResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  activeCount: (json['activeCount'] as num).toInt(),
  totalMonthlyBurden: (json['totalMonthlyBurden'] as num).toDouble(),
);

Map<String, dynamic> _$$SubscriptionSummaryResponseImplToJson(
  _$SubscriptionSummaryResponseImpl instance,
) => <String, dynamic>{
  'subscriptions': instance.subscriptions,
  'activeCount': instance.activeCount,
  'totalMonthlyBurden': instance.totalMonthlyBurden,
};
