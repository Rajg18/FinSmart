// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BudgetRequest _$BudgetRequestFromJson(Map<String, dynamic> json) {
  return _BudgetRequest.fromJson(json);
}

/// @nodoc
mixin _$BudgetRequest {
  String get category => throw _privateConstructorUsedError;
  double get limitAmount => throw _privateConstructorUsedError;

  /// Serializes this BudgetRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetRequestCopyWith<BudgetRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetRequestCopyWith<$Res> {
  factory $BudgetRequestCopyWith(
    BudgetRequest value,
    $Res Function(BudgetRequest) then,
  ) = _$BudgetRequestCopyWithImpl<$Res, BudgetRequest>;
  @useResult
  $Res call({String category, double limitAmount});
}

/// @nodoc
class _$BudgetRequestCopyWithImpl<$Res, $Val extends BudgetRequest>
    implements $BudgetRequestCopyWith<$Res> {
  _$BudgetRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? category = null, Object? limitAmount = null}) {
    return _then(
      _value.copyWith(
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            limitAmount: null == limitAmount
                ? _value.limitAmount
                : limitAmount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BudgetRequestImplCopyWith<$Res>
    implements $BudgetRequestCopyWith<$Res> {
  factory _$$BudgetRequestImplCopyWith(
    _$BudgetRequestImpl value,
    $Res Function(_$BudgetRequestImpl) then,
  ) = __$$BudgetRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, double limitAmount});
}

/// @nodoc
class __$$BudgetRequestImplCopyWithImpl<$Res>
    extends _$BudgetRequestCopyWithImpl<$Res, _$BudgetRequestImpl>
    implements _$$BudgetRequestImplCopyWith<$Res> {
  __$$BudgetRequestImplCopyWithImpl(
    _$BudgetRequestImpl _value,
    $Res Function(_$BudgetRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? category = null, Object? limitAmount = null}) {
    return _then(
      _$BudgetRequestImpl(
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        limitAmount: null == limitAmount
            ? _value.limitAmount
            : limitAmount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetRequestImpl implements _BudgetRequest {
  const _$BudgetRequestImpl({
    required this.category,
    required this.limitAmount,
  });

  factory _$BudgetRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetRequestImplFromJson(json);

  @override
  final String category;
  @override
  final double limitAmount;

  @override
  String toString() {
    return 'BudgetRequest(category: $category, limitAmount: $limitAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetRequestImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limitAmount, limitAmount) ||
                other.limitAmount == limitAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, limitAmount);

  /// Create a copy of BudgetRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetRequestImplCopyWith<_$BudgetRequestImpl> get copyWith =>
      __$$BudgetRequestImplCopyWithImpl<_$BudgetRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetRequestImplToJson(this);
  }
}

abstract class _BudgetRequest implements BudgetRequest {
  const factory _BudgetRequest({
    required final String category,
    required final double limitAmount,
  }) = _$BudgetRequestImpl;

  factory _BudgetRequest.fromJson(Map<String, dynamic> json) =
      _$BudgetRequestImpl.fromJson;

  @override
  String get category;
  @override
  double get limitAmount;

  /// Create a copy of BudgetRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetRequestImplCopyWith<_$BudgetRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetResponse _$BudgetResponseFromJson(Map<String, dynamic> json) {
  return _BudgetResponse.fromJson(json);
}

/// @nodoc
mixin _$BudgetResponse {
  int get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get limitAmount => throw _privateConstructorUsedError;
  double get spentAmount => throw _privateConstructorUsedError;
  double get remainingAmount => throw _privateConstructorUsedError;
  double get percentageUsed => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  bool get alert50Sent => throw _privateConstructorUsedError;
  bool get alert80Sent => throw _privateConstructorUsedError;
  bool get alert100Sent => throw _privateConstructorUsedError;

  /// Serializes this BudgetResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetResponseCopyWith<BudgetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetResponseCopyWith<$Res> {
  factory $BudgetResponseCopyWith(
    BudgetResponse value,
    $Res Function(BudgetResponse) then,
  ) = _$BudgetResponseCopyWithImpl<$Res, BudgetResponse>;
  @useResult
  $Res call({
    int id,
    String category,
    double limitAmount,
    double spentAmount,
    double remainingAmount,
    double percentageUsed,
    int month,
    int year,
    bool alert50Sent,
    bool alert80Sent,
    bool alert100Sent,
  });
}

/// @nodoc
class _$BudgetResponseCopyWithImpl<$Res, $Val extends BudgetResponse>
    implements $BudgetResponseCopyWith<$Res> {
  _$BudgetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? limitAmount = null,
    Object? spentAmount = null,
    Object? remainingAmount = null,
    Object? percentageUsed = null,
    Object? month = null,
    Object? year = null,
    Object? alert50Sent = null,
    Object? alert80Sent = null,
    Object? alert100Sent = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            limitAmount: null == limitAmount
                ? _value.limitAmount
                : limitAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            spentAmount: null == spentAmount
                ? _value.spentAmount
                : spentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            remainingAmount: null == remainingAmount
                ? _value.remainingAmount
                : remainingAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            percentageUsed: null == percentageUsed
                ? _value.percentageUsed
                : percentageUsed // ignore: cast_nullable_to_non_nullable
                      as double,
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            alert50Sent: null == alert50Sent
                ? _value.alert50Sent
                : alert50Sent // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert80Sent: null == alert80Sent
                ? _value.alert80Sent
                : alert80Sent // ignore: cast_nullable_to_non_nullable
                      as bool,
            alert100Sent: null == alert100Sent
                ? _value.alert100Sent
                : alert100Sent // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BudgetResponseImplCopyWith<$Res>
    implements $BudgetResponseCopyWith<$Res> {
  factory _$$BudgetResponseImplCopyWith(
    _$BudgetResponseImpl value,
    $Res Function(_$BudgetResponseImpl) then,
  ) = __$$BudgetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String category,
    double limitAmount,
    double spentAmount,
    double remainingAmount,
    double percentageUsed,
    int month,
    int year,
    bool alert50Sent,
    bool alert80Sent,
    bool alert100Sent,
  });
}

/// @nodoc
class __$$BudgetResponseImplCopyWithImpl<$Res>
    extends _$BudgetResponseCopyWithImpl<$Res, _$BudgetResponseImpl>
    implements _$$BudgetResponseImplCopyWith<$Res> {
  __$$BudgetResponseImplCopyWithImpl(
    _$BudgetResponseImpl _value,
    $Res Function(_$BudgetResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? limitAmount = null,
    Object? spentAmount = null,
    Object? remainingAmount = null,
    Object? percentageUsed = null,
    Object? month = null,
    Object? year = null,
    Object? alert50Sent = null,
    Object? alert80Sent = null,
    Object? alert100Sent = null,
  }) {
    return _then(
      _$BudgetResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        limitAmount: null == limitAmount
            ? _value.limitAmount
            : limitAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        spentAmount: null == spentAmount
            ? _value.spentAmount
            : spentAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        remainingAmount: null == remainingAmount
            ? _value.remainingAmount
            : remainingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        percentageUsed: null == percentageUsed
            ? _value.percentageUsed
            : percentageUsed // ignore: cast_nullable_to_non_nullable
                  as double,
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        alert50Sent: null == alert50Sent
            ? _value.alert50Sent
            : alert50Sent // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert80Sent: null == alert80Sent
            ? _value.alert80Sent
            : alert80Sent // ignore: cast_nullable_to_non_nullable
                  as bool,
        alert100Sent: null == alert100Sent
            ? _value.alert100Sent
            : alert100Sent // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetResponseImpl implements _BudgetResponse {
  const _$BudgetResponseImpl({
    required this.id,
    required this.category,
    required this.limitAmount,
    required this.spentAmount,
    required this.remainingAmount,
    required this.percentageUsed,
    required this.month,
    required this.year,
    required this.alert50Sent,
    required this.alert80Sent,
    required this.alert100Sent,
  });

  factory _$BudgetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String category;
  @override
  final double limitAmount;
  @override
  final double spentAmount;
  @override
  final double remainingAmount;
  @override
  final double percentageUsed;
  @override
  final int month;
  @override
  final int year;
  @override
  final bool alert50Sent;
  @override
  final bool alert80Sent;
  @override
  final bool alert100Sent;

  @override
  String toString() {
    return 'BudgetResponse(id: $id, category: $category, limitAmount: $limitAmount, spentAmount: $spentAmount, remainingAmount: $remainingAmount, percentageUsed: $percentageUsed, month: $month, year: $year, alert50Sent: $alert50Sent, alert80Sent: $alert80Sent, alert100Sent: $alert100Sent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limitAmount, limitAmount) ||
                other.limitAmount == limitAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.alert50Sent, alert50Sent) ||
                other.alert50Sent == alert50Sent) &&
            (identical(other.alert80Sent, alert80Sent) ||
                other.alert80Sent == alert80Sent) &&
            (identical(other.alert100Sent, alert100Sent) ||
                other.alert100Sent == alert100Sent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    category,
    limitAmount,
    spentAmount,
    remainingAmount,
    percentageUsed,
    month,
    year,
    alert50Sent,
    alert80Sent,
    alert100Sent,
  );

  /// Create a copy of BudgetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetResponseImplCopyWith<_$BudgetResponseImpl> get copyWith =>
      __$$BudgetResponseImplCopyWithImpl<_$BudgetResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetResponseImplToJson(this);
  }
}

abstract class _BudgetResponse implements BudgetResponse {
  const factory _BudgetResponse({
    required final int id,
    required final String category,
    required final double limitAmount,
    required final double spentAmount,
    required final double remainingAmount,
    required final double percentageUsed,
    required final int month,
    required final int year,
    required final bool alert50Sent,
    required final bool alert80Sent,
    required final bool alert100Sent,
  }) = _$BudgetResponseImpl;

  factory _BudgetResponse.fromJson(Map<String, dynamic> json) =
      _$BudgetResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get category;
  @override
  double get limitAmount;
  @override
  double get spentAmount;
  @override
  double get remainingAmount;
  @override
  double get percentageUsed;
  @override
  int get month;
  @override
  int get year;
  @override
  bool get alert50Sent;
  @override
  bool get alert80Sent;
  @override
  bool get alert100Sent;

  /// Create a copy of BudgetResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetResponseImplCopyWith<_$BudgetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
