import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_models.freezed.dart';
part 'subscription_models.g.dart';

@freezed
class SubscriptionRequest with _$SubscriptionRequest {
  const factory SubscriptionRequest({
    required String name,
    required double amount,
    required String billingCycle,
    required String startDate,
    String? endDate,
  }) = _SubscriptionRequest;

  factory SubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionRequestFromJson(json);
}

@freezed
class SubscriptionResponse with _$SubscriptionResponse {
  const factory SubscriptionResponse({
    required int id,
    required String name,
    required double amount,
    required String billingCycle,
    required double monthlyEquivalent,
    required String startDate,
    String? endDate,
    String? renewalDate,
    required bool active,
    required String createdAt,
  }) = _SubscriptionResponse;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}

@freezed
class SubscriptionSummaryResponse with _$SubscriptionSummaryResponse {
  const factory SubscriptionSummaryResponse({
    required List<SubscriptionResponse> subscriptions,
    required int activeCount,
    required double totalMonthlyBurden,
  }) = _SubscriptionSummaryResponse;

  factory SubscriptionSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionSummaryResponseFromJson(json);
}
