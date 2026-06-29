// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalRequestImpl _$$GoalRequestImplFromJson(Map<String, dynamic> json) =>
    _$GoalRequestImpl(
      name: json['name'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      deadline: json['deadline'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$GoalRequestImplToJson(_$GoalRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'targetAmount': instance.targetAmount,
      'deadline': instance.deadline,
      'priority': instance.priority,
      'status': instance.status,
    };

_$GoalAllocationRequestImpl _$$GoalAllocationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$GoalAllocationRequestImpl(amount: (json['amount'] as num).toDouble());

Map<String, dynamic> _$$GoalAllocationRequestImplToJson(
  _$GoalAllocationRequestImpl instance,
) => <String, dynamic>{'amount': instance.amount};

_$GoalResponseImpl _$$GoalResponseImplFromJson(Map<String, dynamic> json) =>
    _$GoalResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      savedAmount: (json['savedAmount'] as num).toDouble(),
      remainingAmount: (json['remainingAmount'] as num).toDouble(),
      requiredMonthly: (json['requiredMonthly'] as num?)?.toDouble(),
      progressPercent: (json['progressPercent'] as num).toDouble(),
      deadline: json['deadline'] as String?,
      priority: (json['priority'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$GoalResponseImplToJson(_$GoalResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'targetAmount': instance.targetAmount,
      'savedAmount': instance.savedAmount,
      'remainingAmount': instance.remainingAmount,
      'requiredMonthly': instance.requiredMonthly,
      'progressPercent': instance.progressPercent,
      'deadline': instance.deadline,
      'priority': instance.priority,
      'status': instance.status,
    };
