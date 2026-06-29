// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GoalRequest _$GoalRequestFromJson(Map<String, dynamic> json) {
  return _GoalRequest.fromJson(json);
}

/// @nodoc
mixin _$GoalRequest {
  String get name => throw _privateConstructorUsedError;
  double get targetAmount => throw _privateConstructorUsedError;
  String? get deadline => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this GoalRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalRequestCopyWith<GoalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalRequestCopyWith<$Res> {
  factory $GoalRequestCopyWith(
    GoalRequest value,
    $Res Function(GoalRequest) then,
  ) = _$GoalRequestCopyWithImpl<$Res, GoalRequest>;
  @useResult
  $Res call({
    String name,
    double targetAmount,
    String? deadline,
    int? priority,
    String? status,
  });
}

/// @nodoc
class _$GoalRequestCopyWithImpl<$Res, $Val extends GoalRequest>
    implements $GoalRequestCopyWith<$Res> {
  _$GoalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? targetAmount = null,
    Object? deadline = freezed,
    Object? priority = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            targetAmount: null == targetAmount
                ? _value.targetAmount
                : targetAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            deadline: freezed == deadline
                ? _value.deadline
                : deadline // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalRequestImplCopyWith<$Res>
    implements $GoalRequestCopyWith<$Res> {
  factory _$$GoalRequestImplCopyWith(
    _$GoalRequestImpl value,
    $Res Function(_$GoalRequestImpl) then,
  ) = __$$GoalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double targetAmount,
    String? deadline,
    int? priority,
    String? status,
  });
}

/// @nodoc
class __$$GoalRequestImplCopyWithImpl<$Res>
    extends _$GoalRequestCopyWithImpl<$Res, _$GoalRequestImpl>
    implements _$$GoalRequestImplCopyWith<$Res> {
  __$$GoalRequestImplCopyWithImpl(
    _$GoalRequestImpl _value,
    $Res Function(_$GoalRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? targetAmount = null,
    Object? deadline = freezed,
    Object? priority = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$GoalRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        targetAmount: null == targetAmount
            ? _value.targetAmount
            : targetAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        deadline: freezed == deadline
            ? _value.deadline
            : deadline // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalRequestImpl implements _GoalRequest {
  const _$GoalRequestImpl({
    required this.name,
    required this.targetAmount,
    this.deadline,
    this.priority,
    this.status,
  });

  factory _$GoalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double targetAmount;
  @override
  final String? deadline;
  @override
  final int? priority;
  @override
  final String? status;

  @override
  String toString() {
    return 'GoalRequest(name: $name, targetAmount: $targetAmount, deadline: $deadline, priority: $priority, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, targetAmount, deadline, priority, status);

  /// Create a copy of GoalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalRequestImplCopyWith<_$GoalRequestImpl> get copyWith =>
      __$$GoalRequestImplCopyWithImpl<_$GoalRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalRequestImplToJson(this);
  }
}

abstract class _GoalRequest implements GoalRequest {
  const factory _GoalRequest({
    required final String name,
    required final double targetAmount,
    final String? deadline,
    final int? priority,
    final String? status,
  }) = _$GoalRequestImpl;

  factory _GoalRequest.fromJson(Map<String, dynamic> json) =
      _$GoalRequestImpl.fromJson;

  @override
  String get name;
  @override
  double get targetAmount;
  @override
  String? get deadline;
  @override
  int? get priority;
  @override
  String? get status;

  /// Create a copy of GoalRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalRequestImplCopyWith<_$GoalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalAllocationRequest _$GoalAllocationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _GoalAllocationRequest.fromJson(json);
}

/// @nodoc
mixin _$GoalAllocationRequest {
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this GoalAllocationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalAllocationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalAllocationRequestCopyWith<GoalAllocationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalAllocationRequestCopyWith<$Res> {
  factory $GoalAllocationRequestCopyWith(
    GoalAllocationRequest value,
    $Res Function(GoalAllocationRequest) then,
  ) = _$GoalAllocationRequestCopyWithImpl<$Res, GoalAllocationRequest>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class _$GoalAllocationRequestCopyWithImpl<
  $Res,
  $Val extends GoalAllocationRequest
>
    implements $GoalAllocationRequestCopyWith<$Res> {
  _$GoalAllocationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalAllocationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null}) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalAllocationRequestImplCopyWith<$Res>
    implements $GoalAllocationRequestCopyWith<$Res> {
  factory _$$GoalAllocationRequestImplCopyWith(
    _$GoalAllocationRequestImpl value,
    $Res Function(_$GoalAllocationRequestImpl) then,
  ) = __$$GoalAllocationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$GoalAllocationRequestImplCopyWithImpl<$Res>
    extends
        _$GoalAllocationRequestCopyWithImpl<$Res, _$GoalAllocationRequestImpl>
    implements _$$GoalAllocationRequestImplCopyWith<$Res> {
  __$$GoalAllocationRequestImplCopyWithImpl(
    _$GoalAllocationRequestImpl _value,
    $Res Function(_$GoalAllocationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalAllocationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null}) {
    return _then(
      _$GoalAllocationRequestImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalAllocationRequestImpl implements _GoalAllocationRequest {
  const _$GoalAllocationRequestImpl({required this.amount});

  factory _$GoalAllocationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalAllocationRequestImplFromJson(json);

  @override
  final double amount;

  @override
  String toString() {
    return 'GoalAllocationRequest(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalAllocationRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of GoalAllocationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalAllocationRequestImplCopyWith<_$GoalAllocationRequestImpl>
  get copyWith =>
      __$$GoalAllocationRequestImplCopyWithImpl<_$GoalAllocationRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalAllocationRequestImplToJson(this);
  }
}

abstract class _GoalAllocationRequest implements GoalAllocationRequest {
  const factory _GoalAllocationRequest({required final double amount}) =
      _$GoalAllocationRequestImpl;

  factory _GoalAllocationRequest.fromJson(Map<String, dynamic> json) =
      _$GoalAllocationRequestImpl.fromJson;

  @override
  double get amount;

  /// Create a copy of GoalAllocationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalAllocationRequestImplCopyWith<_$GoalAllocationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

GoalResponse _$GoalResponseFromJson(Map<String, dynamic> json) {
  return _GoalResponse.fromJson(json);
}

/// @nodoc
mixin _$GoalResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get targetAmount => throw _privateConstructorUsedError;
  double get savedAmount => throw _privateConstructorUsedError;
  double get remainingAmount => throw _privateConstructorUsedError;
  double? get requiredMonthly => throw _privateConstructorUsedError;
  double get progressPercent => throw _privateConstructorUsedError;
  String? get deadline => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this GoalResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalResponseCopyWith<GoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalResponseCopyWith<$Res> {
  factory $GoalResponseCopyWith(
    GoalResponse value,
    $Res Function(GoalResponse) then,
  ) = _$GoalResponseCopyWithImpl<$Res, GoalResponse>;
  @useResult
  $Res call({
    int id,
    String name,
    double targetAmount,
    double savedAmount,
    double remainingAmount,
    double? requiredMonthly,
    double progressPercent,
    String? deadline,
    int priority,
    String status,
  });
}

/// @nodoc
class _$GoalResponseCopyWithImpl<$Res, $Val extends GoalResponse>
    implements $GoalResponseCopyWith<$Res> {
  _$GoalResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetAmount = null,
    Object? savedAmount = null,
    Object? remainingAmount = null,
    Object? requiredMonthly = freezed,
    Object? progressPercent = null,
    Object? deadline = freezed,
    Object? priority = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            targetAmount: null == targetAmount
                ? _value.targetAmount
                : targetAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            savedAmount: null == savedAmount
                ? _value.savedAmount
                : savedAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            remainingAmount: null == remainingAmount
                ? _value.remainingAmount
                : remainingAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            requiredMonthly: freezed == requiredMonthly
                ? _value.requiredMonthly
                : requiredMonthly // ignore: cast_nullable_to_non_nullable
                      as double?,
            progressPercent: null == progressPercent
                ? _value.progressPercent
                : progressPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            deadline: freezed == deadline
                ? _value.deadline
                : deadline // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalResponseImplCopyWith<$Res>
    implements $GoalResponseCopyWith<$Res> {
  factory _$$GoalResponseImplCopyWith(
    _$GoalResponseImpl value,
    $Res Function(_$GoalResponseImpl) then,
  ) = __$$GoalResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    double targetAmount,
    double savedAmount,
    double remainingAmount,
    double? requiredMonthly,
    double progressPercent,
    String? deadline,
    int priority,
    String status,
  });
}

/// @nodoc
class __$$GoalResponseImplCopyWithImpl<$Res>
    extends _$GoalResponseCopyWithImpl<$Res, _$GoalResponseImpl>
    implements _$$GoalResponseImplCopyWith<$Res> {
  __$$GoalResponseImplCopyWithImpl(
    _$GoalResponseImpl _value,
    $Res Function(_$GoalResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetAmount = null,
    Object? savedAmount = null,
    Object? remainingAmount = null,
    Object? requiredMonthly = freezed,
    Object? progressPercent = null,
    Object? deadline = freezed,
    Object? priority = null,
    Object? status = null,
  }) {
    return _then(
      _$GoalResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        targetAmount: null == targetAmount
            ? _value.targetAmount
            : targetAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        savedAmount: null == savedAmount
            ? _value.savedAmount
            : savedAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        remainingAmount: null == remainingAmount
            ? _value.remainingAmount
            : remainingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        requiredMonthly: freezed == requiredMonthly
            ? _value.requiredMonthly
            : requiredMonthly // ignore: cast_nullable_to_non_nullable
                  as double?,
        progressPercent: null == progressPercent
            ? _value.progressPercent
            : progressPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        deadline: freezed == deadline
            ? _value.deadline
            : deadline // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalResponseImpl implements _GoalResponse {
  const _$GoalResponseImpl({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.savedAmount,
    required this.remainingAmount,
    this.requiredMonthly,
    required this.progressPercent,
    this.deadline,
    required this.priority,
    required this.status,
  });

  factory _$GoalResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double targetAmount;
  @override
  final double savedAmount;
  @override
  final double remainingAmount;
  @override
  final double? requiredMonthly;
  @override
  final double progressPercent;
  @override
  final String? deadline;
  @override
  final int priority;
  @override
  final String status;

  @override
  String toString() {
    return 'GoalResponse(id: $id, name: $name, targetAmount: $targetAmount, savedAmount: $savedAmount, remainingAmount: $remainingAmount, requiredMonthly: $requiredMonthly, progressPercent: $progressPercent, deadline: $deadline, priority: $priority, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.savedAmount, savedAmount) ||
                other.savedAmount == savedAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.requiredMonthly, requiredMonthly) ||
                other.requiredMonthly == requiredMonthly) &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    targetAmount,
    savedAmount,
    remainingAmount,
    requiredMonthly,
    progressPercent,
    deadline,
    priority,
    status,
  );

  /// Create a copy of GoalResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalResponseImplCopyWith<_$GoalResponseImpl> get copyWith =>
      __$$GoalResponseImplCopyWithImpl<_$GoalResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalResponseImplToJson(this);
  }
}

abstract class _GoalResponse implements GoalResponse {
  const factory _GoalResponse({
    required final int id,
    required final String name,
    required final double targetAmount,
    required final double savedAmount,
    required final double remainingAmount,
    final double? requiredMonthly,
    required final double progressPercent,
    final String? deadline,
    required final int priority,
    required final String status,
  }) = _$GoalResponseImpl;

  factory _GoalResponse.fromJson(Map<String, dynamic> json) =
      _$GoalResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get targetAmount;
  @override
  double get savedAmount;
  @override
  double get remainingAmount;
  @override
  double? get requiredMonthly;
  @override
  double get progressPercent;
  @override
  String? get deadline;
  @override
  int get priority;
  @override
  String get status;

  /// Create a copy of GoalResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalResponseImplCopyWith<_$GoalResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
