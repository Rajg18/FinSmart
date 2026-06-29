import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_models.freezed.dart';
part 'analytics_models.g.dart';

// Category breakdown
@freezed
class CategoryBreakdownItem with _$CategoryBreakdownItem {
  const factory CategoryBreakdownItem({
    required String category,
    required double amount,
    required double percentage,
  }) = _CategoryBreakdownItem;
  factory CategoryBreakdownItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryBreakdownItemFromJson(json);
}

@freezed
class CategoryBreakdownResponse with _$CategoryBreakdownResponse {
  const factory CategoryBreakdownResponse({
    required int month,
    required int year,
    required double totalSpent,
    required List<CategoryBreakdownItem> breakdown,
  }) = _CategoryBreakdownResponse;
  factory CategoryBreakdownResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryBreakdownResponseFromJson(json);
}

// Monthly comparison
@freezed
class MonthSummary with _$MonthSummary {
  const factory MonthSummary({
    required int month,
    required int year,
    required double totalSpent,
    required double totalIncome,
    required int transactionCount,
  }) = _MonthSummary;
  factory MonthSummary.fromJson(Map<String, dynamic> json) =>
      _$MonthSummaryFromJson(json);
}

@freezed
class MonthlyComparisonResponse with _$MonthlyComparisonResponse {
  const factory MonthlyComparisonResponse({
    required MonthSummary period1,
    required MonthSummary period2,
    required double difference,
    required double changePercent,
  }) = _MonthlyComparisonResponse;
  factory MonthlyComparisonResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthlyComparisonResponseFromJson(json);
}

// Spending trend
@freezed
class MonthlyPoint with _$MonthlyPoint {
  const factory MonthlyPoint({
    required int month,
    required int year,
    required double totalSpent,
    required double totalIncome,
  }) = _MonthlyPoint;
  factory MonthlyPoint.fromJson(Map<String, dynamic> json) =>
      _$MonthlyPointFromJson(json);
}

@freezed
class SpendingTrendResponse with _$SpendingTrendResponse {
  const factory SpendingTrendResponse({
    required List<MonthlyPoint> trend,
  }) = _SpendingTrendResponse;
  factory SpendingTrendResponse.fromJson(Map<String, dynamic> json) =>
      _$SpendingTrendResponseFromJson(json);
}

// Top merchants
@freezed
class MerchantStat with _$MerchantStat {
  const factory MerchantStat({
    required String merchant,
    required double totalSpent,
    required int transactionCount,
  }) = _MerchantStat;
  factory MerchantStat.fromJson(Map<String, dynamic> json) =>
      _$MerchantStatFromJson(json);
}

@freezed
class TopMerchantsResponse with _$TopMerchantsResponse {
  const factory TopMerchantsResponse({
    required int month,
    required int year,
    required List<MerchantStat> merchants,
  }) = _TopMerchantsResponse;
  factory TopMerchantsResponse.fromJson(Map<String, dynamic> json) =>
      _$TopMerchantsResponseFromJson(json);
}
