import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_models.freezed.dart';
part 'transaction_models.g.dart';

enum TransactionType { DEBIT, CREDIT, GOAL_ALLOCATION }
enum TransactionCategory {
  FOOD, TRANSPORT, GROCERIES, ENTERTAINMENT, SUBSCRIPTION,
  HEALTHCARE, EDUCATION, SHOPPING, UTILITIES, INCOME, SAVINGS, OTHERS
}

@freezed
class TransactionRequest with _$TransactionRequest {
  const factory TransactionRequest({
    required String merchant,
    required double amount,
    required String type,
    required String category,
    String? paymentMethod,
    String? transactionDate,
  }) = _TransactionRequest;

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);
}

@freezed
class TransactionItem with _$TransactionItem {
  const factory TransactionItem({
    required int id,
    required String merchant,
    required double amount,
    required String type,
    required String category,
    String? paymentMethod,
    String? source,
    required String transactionDate,
    required String createdAt,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);
}

@freezed
class TransactionPage with _$TransactionPage {
  const factory TransactionPage({
    required List<TransactionItem> content,
    required int totalElements,
    required int totalPages,
    required int number,
    required bool last,
  }) = _TransactionPage;

  factory TransactionPage.fromJson(Map<String, dynamic> json) =>
      _$TransactionPageFromJson(json);
}
