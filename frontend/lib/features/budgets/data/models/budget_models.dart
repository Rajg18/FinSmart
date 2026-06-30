import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_models.freezed.dart';
part 'budget_models.g.dart';

@freezed
class BudgetRequest with _$BudgetRequest {
  const factory BudgetRequest({
    required String category,
    required double limitAmount,
  }) = _BudgetRequest;

  factory BudgetRequest.fromJson(Map<String, dynamic> json) =>
      _$BudgetRequestFromJson(json);
}

@freezed
class BudgetResponse with _$BudgetResponse {
  const factory BudgetResponse({
    required int id,
    required String category,
    required double limitAmount,
    required double spentAmount,
    required double remainingAmount,
    required double percentageUsed,
    required int month,
    required int year,
    @Default(false) bool alert50Sent,
    @Default(false) bool alert80Sent,
    @Default(false) bool alert100Sent,
  }) = _BudgetResponse;

  factory BudgetResponse.fromJson(Map<String, dynamic> json) =>
      _$BudgetResponseFromJson(json);
}
