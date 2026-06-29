// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscriptionRequest _$SubscriptionRequestFromJson(Map<String, dynamic> json) {
  return _SubscriptionRequest.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionRequest {
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get billingCycle => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionRequestCopyWith<SubscriptionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionRequestCopyWith<$Res> {
  factory $SubscriptionRequestCopyWith(
    SubscriptionRequest value,
    $Res Function(SubscriptionRequest) then,
  ) = _$SubscriptionRequestCopyWithImpl<$Res, SubscriptionRequest>;
  @useResult
  $Res call({
    String name,
    double amount,
    String billingCycle,
    String startDate,
    String? endDate,
  });
}

/// @nodoc
class _$SubscriptionRequestCopyWithImpl<$Res, $Val extends SubscriptionRequest>
    implements $SubscriptionRequestCopyWith<$Res> {
  _$SubscriptionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? billingCycle = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            billingCycle: null == billingCycle
                ? _value.billingCycle
                : billingCycle // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionRequestImplCopyWith<$Res>
    implements $SubscriptionRequestCopyWith<$Res> {
  factory _$$SubscriptionRequestImplCopyWith(
    _$SubscriptionRequestImpl value,
    $Res Function(_$SubscriptionRequestImpl) then,
  ) = __$$SubscriptionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double amount,
    String billingCycle,
    String startDate,
    String? endDate,
  });
}

/// @nodoc
class __$$SubscriptionRequestImplCopyWithImpl<$Res>
    extends _$SubscriptionRequestCopyWithImpl<$Res, _$SubscriptionRequestImpl>
    implements _$$SubscriptionRequestImplCopyWith<$Res> {
  __$$SubscriptionRequestImplCopyWithImpl(
    _$SubscriptionRequestImpl _value,
    $Res Function(_$SubscriptionRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? billingCycle = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(
      _$SubscriptionRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        billingCycle: null == billingCycle
            ? _value.billingCycle
            : billingCycle // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionRequestImpl implements _SubscriptionRequest {
  const _$SubscriptionRequestImpl({
    required this.name,
    required this.amount,
    required this.billingCycle,
    required this.startDate,
    this.endDate,
  });

  factory _$SubscriptionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double amount;
  @override
  final String billingCycle;
  @override
  final String startDate;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'SubscriptionRequest(name: $name, amount: $amount, billingCycle: $billingCycle, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.billingCycle, billingCycle) ||
                other.billingCycle == billingCycle) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, amount, billingCycle, startDate, endDate);

  /// Create a copy of SubscriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionRequestImplCopyWith<_$SubscriptionRequestImpl> get copyWith =>
      __$$SubscriptionRequestImplCopyWithImpl<_$SubscriptionRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionRequestImplToJson(this);
  }
}

abstract class _SubscriptionRequest implements SubscriptionRequest {
  const factory _SubscriptionRequest({
    required final String name,
    required final double amount,
    required final String billingCycle,
    required final String startDate,
    final String? endDate,
  }) = _$SubscriptionRequestImpl;

  factory _SubscriptionRequest.fromJson(Map<String, dynamic> json) =
      _$SubscriptionRequestImpl.fromJson;

  @override
  String get name;
  @override
  double get amount;
  @override
  String get billingCycle;
  @override
  String get startDate;
  @override
  String? get endDate;

  /// Create a copy of SubscriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionRequestImplCopyWith<_$SubscriptionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionResponse _$SubscriptionResponseFromJson(Map<String, dynamic> json) {
  return _SubscriptionResponse.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get billingCycle => throw _privateConstructorUsedError;
  double get monthlyEquivalent => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get renewalDate => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionResponseCopyWith<SubscriptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionResponseCopyWith<$Res> {
  factory $SubscriptionResponseCopyWith(
    SubscriptionResponse value,
    $Res Function(SubscriptionResponse) then,
  ) = _$SubscriptionResponseCopyWithImpl<$Res, SubscriptionResponse>;
  @useResult
  $Res call({
    int id,
    String name,
    double amount,
    String billingCycle,
    double monthlyEquivalent,
    String startDate,
    String? endDate,
    String? renewalDate,
    bool active,
    String createdAt,
  });
}

/// @nodoc
class _$SubscriptionResponseCopyWithImpl<
  $Res,
  $Val extends SubscriptionResponse
>
    implements $SubscriptionResponseCopyWith<$Res> {
  _$SubscriptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? billingCycle = null,
    Object? monthlyEquivalent = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? renewalDate = freezed,
    Object? active = null,
    Object? createdAt = null,
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
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            billingCycle: null == billingCycle
                ? _value.billingCycle
                : billingCycle // ignore: cast_nullable_to_non_nullable
                      as String,
            monthlyEquivalent: null == monthlyEquivalent
                ? _value.monthlyEquivalent
                : monthlyEquivalent // ignore: cast_nullable_to_non_nullable
                      as double,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            renewalDate: freezed == renewalDate
                ? _value.renewalDate
                : renewalDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionResponseImplCopyWith<$Res>
    implements $SubscriptionResponseCopyWith<$Res> {
  factory _$$SubscriptionResponseImplCopyWith(
    _$SubscriptionResponseImpl value,
    $Res Function(_$SubscriptionResponseImpl) then,
  ) = __$$SubscriptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    double amount,
    String billingCycle,
    double monthlyEquivalent,
    String startDate,
    String? endDate,
    String? renewalDate,
    bool active,
    String createdAt,
  });
}

/// @nodoc
class __$$SubscriptionResponseImplCopyWithImpl<$Res>
    extends _$SubscriptionResponseCopyWithImpl<$Res, _$SubscriptionResponseImpl>
    implements _$$SubscriptionResponseImplCopyWith<$Res> {
  __$$SubscriptionResponseImplCopyWithImpl(
    _$SubscriptionResponseImpl _value,
    $Res Function(_$SubscriptionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? billingCycle = null,
    Object? monthlyEquivalent = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? renewalDate = freezed,
    Object? active = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$SubscriptionResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        billingCycle: null == billingCycle
            ? _value.billingCycle
            : billingCycle // ignore: cast_nullable_to_non_nullable
                  as String,
        monthlyEquivalent: null == monthlyEquivalent
            ? _value.monthlyEquivalent
            : monthlyEquivalent // ignore: cast_nullable_to_non_nullable
                  as double,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        renewalDate: freezed == renewalDate
            ? _value.renewalDate
            : renewalDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionResponseImpl implements _SubscriptionResponse {
  const _$SubscriptionResponseImpl({
    required this.id,
    required this.name,
    required this.amount,
    required this.billingCycle,
    required this.monthlyEquivalent,
    required this.startDate,
    this.endDate,
    this.renewalDate,
    required this.active,
    required this.createdAt,
  });

  factory _$SubscriptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double amount;
  @override
  final String billingCycle;
  @override
  final double monthlyEquivalent;
  @override
  final String startDate;
  @override
  final String? endDate;
  @override
  final String? renewalDate;
  @override
  final bool active;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'SubscriptionResponse(id: $id, name: $name, amount: $amount, billingCycle: $billingCycle, monthlyEquivalent: $monthlyEquivalent, startDate: $startDate, endDate: $endDate, renewalDate: $renewalDate, active: $active, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.billingCycle, billingCycle) ||
                other.billingCycle == billingCycle) &&
            (identical(other.monthlyEquivalent, monthlyEquivalent) ||
                other.monthlyEquivalent == monthlyEquivalent) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.renewalDate, renewalDate) ||
                other.renewalDate == renewalDate) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    amount,
    billingCycle,
    monthlyEquivalent,
    startDate,
    endDate,
    renewalDate,
    active,
    createdAt,
  );

  /// Create a copy of SubscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionResponseImplCopyWith<_$SubscriptionResponseImpl>
  get copyWith =>
      __$$SubscriptionResponseImplCopyWithImpl<_$SubscriptionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionResponseImplToJson(this);
  }
}

abstract class _SubscriptionResponse implements SubscriptionResponse {
  const factory _SubscriptionResponse({
    required final int id,
    required final String name,
    required final double amount,
    required final String billingCycle,
    required final double monthlyEquivalent,
    required final String startDate,
    final String? endDate,
    final String? renewalDate,
    required final bool active,
    required final String createdAt,
  }) = _$SubscriptionResponseImpl;

  factory _SubscriptionResponse.fromJson(Map<String, dynamic> json) =
      _$SubscriptionResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  String get billingCycle;
  @override
  double get monthlyEquivalent;
  @override
  String get startDate;
  @override
  String? get endDate;
  @override
  String? get renewalDate;
  @override
  bool get active;
  @override
  String get createdAt;

  /// Create a copy of SubscriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionResponseImplCopyWith<_$SubscriptionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubscriptionSummaryResponse _$SubscriptionSummaryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionSummaryResponse {
  List<SubscriptionResponse> get subscriptions =>
      throw _privateConstructorUsedError;
  int get activeCount => throw _privateConstructorUsedError;
  double get totalMonthlyBurden => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionSummaryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionSummaryResponseCopyWith<SubscriptionSummaryResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionSummaryResponseCopyWith<$Res> {
  factory $SubscriptionSummaryResponseCopyWith(
    SubscriptionSummaryResponse value,
    $Res Function(SubscriptionSummaryResponse) then,
  ) =
      _$SubscriptionSummaryResponseCopyWithImpl<
        $Res,
        SubscriptionSummaryResponse
      >;
  @useResult
  $Res call({
    List<SubscriptionResponse> subscriptions,
    int activeCount,
    double totalMonthlyBurden,
  });
}

/// @nodoc
class _$SubscriptionSummaryResponseCopyWithImpl<
  $Res,
  $Val extends SubscriptionSummaryResponse
>
    implements $SubscriptionSummaryResponseCopyWith<$Res> {
  _$SubscriptionSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptions = null,
    Object? activeCount = null,
    Object? totalMonthlyBurden = null,
  }) {
    return _then(
      _value.copyWith(
            subscriptions: null == subscriptions
                ? _value.subscriptions
                : subscriptions // ignore: cast_nullable_to_non_nullable
                      as List<SubscriptionResponse>,
            activeCount: null == activeCount
                ? _value.activeCount
                : activeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalMonthlyBurden: null == totalMonthlyBurden
                ? _value.totalMonthlyBurden
                : totalMonthlyBurden // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionSummaryResponseImplCopyWith<$Res>
    implements $SubscriptionSummaryResponseCopyWith<$Res> {
  factory _$$SubscriptionSummaryResponseImplCopyWith(
    _$SubscriptionSummaryResponseImpl value,
    $Res Function(_$SubscriptionSummaryResponseImpl) then,
  ) = __$$SubscriptionSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<SubscriptionResponse> subscriptions,
    int activeCount,
    double totalMonthlyBurden,
  });
}

/// @nodoc
class __$$SubscriptionSummaryResponseImplCopyWithImpl<$Res>
    extends
        _$SubscriptionSummaryResponseCopyWithImpl<
          $Res,
          _$SubscriptionSummaryResponseImpl
        >
    implements _$$SubscriptionSummaryResponseImplCopyWith<$Res> {
  __$$SubscriptionSummaryResponseImplCopyWithImpl(
    _$SubscriptionSummaryResponseImpl _value,
    $Res Function(_$SubscriptionSummaryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptions = null,
    Object? activeCount = null,
    Object? totalMonthlyBurden = null,
  }) {
    return _then(
      _$SubscriptionSummaryResponseImpl(
        subscriptions: null == subscriptions
            ? _value._subscriptions
            : subscriptions // ignore: cast_nullable_to_non_nullable
                  as List<SubscriptionResponse>,
        activeCount: null == activeCount
            ? _value.activeCount
            : activeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalMonthlyBurden: null == totalMonthlyBurden
            ? _value.totalMonthlyBurden
            : totalMonthlyBurden // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionSummaryResponseImpl
    implements _SubscriptionSummaryResponse {
  const _$SubscriptionSummaryResponseImpl({
    required final List<SubscriptionResponse> subscriptions,
    required this.activeCount,
    required this.totalMonthlyBurden,
  }) : _subscriptions = subscriptions;

  factory _$SubscriptionSummaryResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SubscriptionSummaryResponseImplFromJson(json);

  final List<SubscriptionResponse> _subscriptions;
  @override
  List<SubscriptionResponse> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  final int activeCount;
  @override
  final double totalMonthlyBurden;

  @override
  String toString() {
    return 'SubscriptionSummaryResponse(subscriptions: $subscriptions, activeCount: $activeCount, totalMonthlyBurden: $totalMonthlyBurden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionSummaryResponseImpl &&
            const DeepCollectionEquality().equals(
              other._subscriptions,
              _subscriptions,
            ) &&
            (identical(other.activeCount, activeCount) ||
                other.activeCount == activeCount) &&
            (identical(other.totalMonthlyBurden, totalMonthlyBurden) ||
                other.totalMonthlyBurden == totalMonthlyBurden));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_subscriptions),
    activeCount,
    totalMonthlyBurden,
  );

  /// Create a copy of SubscriptionSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionSummaryResponseImplCopyWith<_$SubscriptionSummaryResponseImpl>
  get copyWith =>
      __$$SubscriptionSummaryResponseImplCopyWithImpl<
        _$SubscriptionSummaryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionSummaryResponseImplToJson(this);
  }
}

abstract class _SubscriptionSummaryResponse
    implements SubscriptionSummaryResponse {
  const factory _SubscriptionSummaryResponse({
    required final List<SubscriptionResponse> subscriptions,
    required final int activeCount,
    required final double totalMonthlyBurden,
  }) = _$SubscriptionSummaryResponseImpl;

  factory _SubscriptionSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$SubscriptionSummaryResponseImpl.fromJson;

  @override
  List<SubscriptionResponse> get subscriptions;
  @override
  int get activeCount;
  @override
  double get totalMonthlyBurden;

  /// Create a copy of SubscriptionSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionSummaryResponseImplCopyWith<_$SubscriptionSummaryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
