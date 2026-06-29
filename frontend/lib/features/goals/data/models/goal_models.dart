import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_models.freezed.dart';
part 'goal_models.g.dart';

@freezed
class GoalRequest with _$GoalRequest {
  const factory GoalRequest({
    required String name,
    required double targetAmount,
    String? deadline,
    int? priority,
    String? status,
  }) = _GoalRequest;

  factory GoalRequest.fromJson(Map<String, dynamic> json) =>
      _$GoalRequestFromJson(json);
}

@freezed
class GoalAllocationRequest with _$GoalAllocationRequest {
  const factory GoalAllocationRequest({
    required double amount,
  }) = _GoalAllocationRequest;

  factory GoalAllocationRequest.fromJson(Map<String, dynamic> json) =>
      _$GoalAllocationRequestFromJson(json);
}

@freezed
class GoalResponse with _$GoalResponse {
  const factory GoalResponse({
    required int id,
    required String name,
    required double targetAmount,
    required double savedAmount,
    required double remainingAmount,
    double? requiredMonthly,
    required double progressPercent,
    String? deadline,
    required int priority,
    required String status,
  }) = _GoalResponse;

  factory GoalResponse.fromJson(Map<String, dynamic> json) =>
      _$GoalResponseFromJson(json);
}
