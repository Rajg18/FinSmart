import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    required int id,
    required String merchant,
    required double amount,
    required String type,
    required String category,
    String? paymentMethod,
    String? source,
    required String transactionDate,
    required String createdAt,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}

@freezed
class BudgetCard with _$BudgetCard {
  const factory BudgetCard({
    required String category,
    required double limitAmount,
    required double spentAmount,
    required double percentageUsed,
  }) = _BudgetCard;

  factory BudgetCard.fromJson(Map<String, dynamic> json) =>
      _$BudgetCardFromJson(json);
}

@freezed
class GoalCard with _$GoalCard {
  const factory GoalCard({
    required int id,
    required String name,
    required double targetAmount,
    required double savedAmount,
    required double progressPercent,
    required double requiredMonthly,
    String? deadline,
  }) = _GoalCard;

  factory GoalCard.fromJson(Map<String, dynamic> json) =>
      _$GoalCardFromJson(json);
}

@freezed
class SubscriptionCard with _$SubscriptionCard {
  const factory SubscriptionCard({
    required int activeCount,
    required double totalMonthlyBurden,
  }) = _SubscriptionCard;

  factory SubscriptionCard.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionCardFromJson(json);
}

@freezed
class SalaryBanner with _$SalaryBanner {
  const factory SalaryBanner({
    required double amount,
    required String merchant,
    required String creditedAt,
  }) = _SalaryBanner;

  factory SalaryBanner.fromJson(Map<String, dynamic> json) =>
      _$SalaryBannerFromJson(json);
}

@freezed
class DashboardResponse with _$DashboardResponse {
  const factory DashboardResponse({
    required double currentBalance,
    required double monthlyIncome,
    required double monthlyExpenses,
    required double projectedMonthlyExpense,
    required List<TransactionResponse> recentTransactions,
    required List<BudgetCard> budgets,
    required List<GoalCard> goals,
    required SubscriptionCard subscriptions,
    SalaryBanner? salaryBanner,
  }) = _DashboardResponse;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);
}

@freezed
class BankFeedResponse with _$BankFeedResponse {
  const factory BankFeedResponse({
    required int transactionsAdded,
    required List<TransactionResponse> transactions,
    required String syncedAt,
    required String nextSlotAvailableAt,
  }) = _BankFeedResponse;

  factory BankFeedResponse.fromJson(Map<String, dynamic> json) =>
      _$BankFeedResponseFromJson(json);
}
