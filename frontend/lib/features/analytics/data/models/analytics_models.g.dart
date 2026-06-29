// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryBreakdownItemImpl _$$CategoryBreakdownItemImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryBreakdownItemImpl(
  category: json['category'] as String,
  amount: (json['amount'] as num).toDouble(),
  percentage: (json['percentage'] as num).toDouble(),
);

Map<String, dynamic> _$$CategoryBreakdownItemImplToJson(
  _$CategoryBreakdownItemImpl instance,
) => <String, dynamic>{
  'category': instance.category,
  'amount': instance.amount,
  'percentage': instance.percentage,
};

_$CategoryBreakdownResponseImpl _$$CategoryBreakdownResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryBreakdownResponseImpl(
  month: (json['month'] as num).toInt(),
  year: (json['year'] as num).toInt(),
  totalSpent: (json['totalSpent'] as num).toDouble(),
  breakdown: (json['breakdown'] as List<dynamic>)
      .map((e) => CategoryBreakdownItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CategoryBreakdownResponseImplToJson(
  _$CategoryBreakdownResponseImpl instance,
) => <String, dynamic>{
  'month': instance.month,
  'year': instance.year,
  'totalSpent': instance.totalSpent,
  'breakdown': instance.breakdown,
};

_$MonthSummaryImpl _$$MonthSummaryImplFromJson(Map<String, dynamic> json) =>
    _$MonthSummaryImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
    );

Map<String, dynamic> _$$MonthSummaryImplToJson(_$MonthSummaryImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'totalSpent': instance.totalSpent,
      'totalIncome': instance.totalIncome,
      'transactionCount': instance.transactionCount,
    };

_$MonthlyComparisonResponseImpl _$$MonthlyComparisonResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyComparisonResponseImpl(
  period1: MonthSummary.fromJson(json['period1'] as Map<String, dynamic>),
  period2: MonthSummary.fromJson(json['period2'] as Map<String, dynamic>),
  difference: (json['difference'] as num).toDouble(),
  changePercent: (json['changePercent'] as num).toDouble(),
);

Map<String, dynamic> _$$MonthlyComparisonResponseImplToJson(
  _$MonthlyComparisonResponseImpl instance,
) => <String, dynamic>{
  'period1': instance.period1,
  'period2': instance.period2,
  'difference': instance.difference,
  'changePercent': instance.changePercent,
};

_$MonthlyPointImpl _$$MonthlyPointImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyPointImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlyPointImplToJson(_$MonthlyPointImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'totalSpent': instance.totalSpent,
      'totalIncome': instance.totalIncome,
    };

_$SpendingTrendResponseImpl _$$SpendingTrendResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SpendingTrendResponseImpl(
  trend: (json['trend'] as List<dynamic>)
      .map((e) => MonthlyPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$SpendingTrendResponseImplToJson(
  _$SpendingTrendResponseImpl instance,
) => <String, dynamic>{'trend': instance.trend};

_$MerchantStatImpl _$$MerchantStatImplFromJson(Map<String, dynamic> json) =>
    _$MerchantStatImpl(
      merchant: json['merchant'] as String,
      totalSpent: (json['totalSpent'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
    );

Map<String, dynamic> _$$MerchantStatImplToJson(_$MerchantStatImpl instance) =>
    <String, dynamic>{
      'merchant': instance.merchant,
      'totalSpent': instance.totalSpent,
      'transactionCount': instance.transactionCount,
    };

_$TopMerchantsResponseImpl _$$TopMerchantsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TopMerchantsResponseImpl(
  month: (json['month'] as num).toInt(),
  year: (json['year'] as num).toInt(),
  merchants: (json['merchants'] as List<dynamic>)
      .map((e) => MerchantStat.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$TopMerchantsResponseImplToJson(
  _$TopMerchantsResponseImpl instance,
) => <String, dynamic>{
  'month': instance.month,
  'year': instance.year,
  'merchants': instance.merchants,
};
