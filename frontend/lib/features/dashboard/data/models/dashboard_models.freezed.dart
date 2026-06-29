// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return _TransactionResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionResponse {
  int get id => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String get transactionDate => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionResponseCopyWith<TransactionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResponseCopyWith<$Res> {
  factory $TransactionResponseCopyWith(
    TransactionResponse value,
    $Res Function(TransactionResponse) then,
  ) = _$TransactionResponseCopyWithImpl<$Res, TransactionResponse>;
  @useResult
  $Res call({
    int id,
    String merchant,
    double amount,
    String type,
    String category,
    String? paymentMethod,
    String? source,
    String transactionDate,
    String createdAt,
  });
}

/// @nodoc
class _$TransactionResponseCopyWithImpl<$Res, $Val extends TransactionResponse>
    implements $TransactionResponseCopyWith<$Res> {
  _$TransactionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchant = null,
    Object? amount = null,
    Object? type = null,
    Object? category = null,
    Object? paymentMethod = freezed,
    Object? source = freezed,
    Object? transactionDate = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            merchant: null == merchant
                ? _value.merchant
                : merchant // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            transactionDate: null == transactionDate
                ? _value.transactionDate
                : transactionDate // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$TransactionResponseImplCopyWith<$Res>
    implements $TransactionResponseCopyWith<$Res> {
  factory _$$TransactionResponseImplCopyWith(
    _$TransactionResponseImpl value,
    $Res Function(_$TransactionResponseImpl) then,
  ) = __$$TransactionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String merchant,
    double amount,
    String type,
    String category,
    String? paymentMethod,
    String? source,
    String transactionDate,
    String createdAt,
  });
}

/// @nodoc
class __$$TransactionResponseImplCopyWithImpl<$Res>
    extends _$TransactionResponseCopyWithImpl<$Res, _$TransactionResponseImpl>
    implements _$$TransactionResponseImplCopyWith<$Res> {
  __$$TransactionResponseImplCopyWithImpl(
    _$TransactionResponseImpl _value,
    $Res Function(_$TransactionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchant = null,
    Object? amount = null,
    Object? type = null,
    Object? category = null,
    Object? paymentMethod = freezed,
    Object? source = freezed,
    Object? transactionDate = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$TransactionResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        merchant: null == merchant
            ? _value.merchant
            : merchant // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        transactionDate: null == transactionDate
            ? _value.transactionDate
            : transactionDate // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$TransactionResponseImpl implements _TransactionResponse {
  const _$TransactionResponseImpl({
    required this.id,
    required this.merchant,
    required this.amount,
    required this.type,
    required this.category,
    this.paymentMethod,
    this.source,
    required this.transactionDate,
    required this.createdAt,
  });

  factory _$TransactionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String merchant;
  @override
  final double amount;
  @override
  final String type;
  @override
  final String category;
  @override
  final String? paymentMethod;
  @override
  final String? source;
  @override
  final String transactionDate;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'TransactionResponse(id: $id, merchant: $merchant, amount: $amount, type: $type, category: $category, paymentMethod: $paymentMethod, source: $source, transactionDate: $transactionDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    merchant,
    amount,
    type,
    category,
    paymentMethod,
    source,
    transactionDate,
    createdAt,
  );

  /// Create a copy of TransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionResponseImplCopyWith<_$TransactionResponseImpl> get copyWith =>
      __$$TransactionResponseImplCopyWithImpl<_$TransactionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionResponseImplToJson(this);
  }
}

abstract class _TransactionResponse implements TransactionResponse {
  const factory _TransactionResponse({
    required final int id,
    required final String merchant,
    required final double amount,
    required final String type,
    required final String category,
    final String? paymentMethod,
    final String? source,
    required final String transactionDate,
    required final String createdAt,
  }) = _$TransactionResponseImpl;

  factory _TransactionResponse.fromJson(Map<String, dynamic> json) =
      _$TransactionResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get merchant;
  @override
  double get amount;
  @override
  String get type;
  @override
  String get category;
  @override
  String? get paymentMethod;
  @override
  String? get source;
  @override
  String get transactionDate;
  @override
  String get createdAt;

  /// Create a copy of TransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionResponseImplCopyWith<_$TransactionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetCard _$BudgetCardFromJson(Map<String, dynamic> json) {
  return _BudgetCard.fromJson(json);
}

/// @nodoc
mixin _$BudgetCard {
  String get category => throw _privateConstructorUsedError;
  double get limitAmount => throw _privateConstructorUsedError;
  double get spentAmount => throw _privateConstructorUsedError;
  double get percentageUsed => throw _privateConstructorUsedError;

  /// Serializes this BudgetCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetCardCopyWith<BudgetCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCardCopyWith<$Res> {
  factory $BudgetCardCopyWith(
    BudgetCard value,
    $Res Function(BudgetCard) then,
  ) = _$BudgetCardCopyWithImpl<$Res, BudgetCard>;
  @useResult
  $Res call({
    String category,
    double limitAmount,
    double spentAmount,
    double percentageUsed,
  });
}

/// @nodoc
class _$BudgetCardCopyWithImpl<$Res, $Val extends BudgetCard>
    implements $BudgetCardCopyWith<$Res> {
  _$BudgetCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? limitAmount = null,
    Object? spentAmount = null,
    Object? percentageUsed = null,
  }) {
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
            spentAmount: null == spentAmount
                ? _value.spentAmount
                : spentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            percentageUsed: null == percentageUsed
                ? _value.percentageUsed
                : percentageUsed // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BudgetCardImplCopyWith<$Res>
    implements $BudgetCardCopyWith<$Res> {
  factory _$$BudgetCardImplCopyWith(
    _$BudgetCardImpl value,
    $Res Function(_$BudgetCardImpl) then,
  ) = __$$BudgetCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String category,
    double limitAmount,
    double spentAmount,
    double percentageUsed,
  });
}

/// @nodoc
class __$$BudgetCardImplCopyWithImpl<$Res>
    extends _$BudgetCardCopyWithImpl<$Res, _$BudgetCardImpl>
    implements _$$BudgetCardImplCopyWith<$Res> {
  __$$BudgetCardImplCopyWithImpl(
    _$BudgetCardImpl _value,
    $Res Function(_$BudgetCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? limitAmount = null,
    Object? spentAmount = null,
    Object? percentageUsed = null,
  }) {
    return _then(
      _$BudgetCardImpl(
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
        percentageUsed: null == percentageUsed
            ? _value.percentageUsed
            : percentageUsed // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetCardImpl implements _BudgetCard {
  const _$BudgetCardImpl({
    required this.category,
    required this.limitAmount,
    required this.spentAmount,
    required this.percentageUsed,
  });

  factory _$BudgetCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetCardImplFromJson(json);

  @override
  final String category;
  @override
  final double limitAmount;
  @override
  final double spentAmount;
  @override
  final double percentageUsed;

  @override
  String toString() {
    return 'BudgetCard(category: $category, limitAmount: $limitAmount, spentAmount: $spentAmount, percentageUsed: $percentageUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetCardImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limitAmount, limitAmount) ||
                other.limitAmount == limitAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    category,
    limitAmount,
    spentAmount,
    percentageUsed,
  );

  /// Create a copy of BudgetCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetCardImplCopyWith<_$BudgetCardImpl> get copyWith =>
      __$$BudgetCardImplCopyWithImpl<_$BudgetCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetCardImplToJson(this);
  }
}

abstract class _BudgetCard implements BudgetCard {
  const factory _BudgetCard({
    required final String category,
    required final double limitAmount,
    required final double spentAmount,
    required final double percentageUsed,
  }) = _$BudgetCardImpl;

  factory _BudgetCard.fromJson(Map<String, dynamic> json) =
      _$BudgetCardImpl.fromJson;

  @override
  String get category;
  @override
  double get limitAmount;
  @override
  double get spentAmount;
  @override
  double get percentageUsed;

  /// Create a copy of BudgetCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetCardImplCopyWith<_$BudgetCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalCard _$GoalCardFromJson(Map<String, dynamic> json) {
  return _GoalCard.fromJson(json);
}

/// @nodoc
mixin _$GoalCard {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get targetAmount => throw _privateConstructorUsedError;
  double get savedAmount => throw _privateConstructorUsedError;
  double get progressPercent => throw _privateConstructorUsedError;
  double get requiredMonthly => throw _privateConstructorUsedError;
  String? get deadline => throw _privateConstructorUsedError;

  /// Serializes this GoalCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalCardCopyWith<GoalCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCardCopyWith<$Res> {
  factory $GoalCardCopyWith(GoalCard value, $Res Function(GoalCard) then) =
      _$GoalCardCopyWithImpl<$Res, GoalCard>;
  @useResult
  $Res call({
    int id,
    String name,
    double targetAmount,
    double savedAmount,
    double progressPercent,
    double requiredMonthly,
    String? deadline,
  });
}

/// @nodoc
class _$GoalCardCopyWithImpl<$Res, $Val extends GoalCard>
    implements $GoalCardCopyWith<$Res> {
  _$GoalCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetAmount = null,
    Object? savedAmount = null,
    Object? progressPercent = null,
    Object? requiredMonthly = null,
    Object? deadline = freezed,
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
            progressPercent: null == progressPercent
                ? _value.progressPercent
                : progressPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            requiredMonthly: null == requiredMonthly
                ? _value.requiredMonthly
                : requiredMonthly // ignore: cast_nullable_to_non_nullable
                      as double,
            deadline: freezed == deadline
                ? _value.deadline
                : deadline // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalCardImplCopyWith<$Res>
    implements $GoalCardCopyWith<$Res> {
  factory _$$GoalCardImplCopyWith(
    _$GoalCardImpl value,
    $Res Function(_$GoalCardImpl) then,
  ) = __$$GoalCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    double targetAmount,
    double savedAmount,
    double progressPercent,
    double requiredMonthly,
    String? deadline,
  });
}

/// @nodoc
class __$$GoalCardImplCopyWithImpl<$Res>
    extends _$GoalCardCopyWithImpl<$Res, _$GoalCardImpl>
    implements _$$GoalCardImplCopyWith<$Res> {
  __$$GoalCardImplCopyWithImpl(
    _$GoalCardImpl _value,
    $Res Function(_$GoalCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetAmount = null,
    Object? savedAmount = null,
    Object? progressPercent = null,
    Object? requiredMonthly = null,
    Object? deadline = freezed,
  }) {
    return _then(
      _$GoalCardImpl(
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
        progressPercent: null == progressPercent
            ? _value.progressPercent
            : progressPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        requiredMonthly: null == requiredMonthly
            ? _value.requiredMonthly
            : requiredMonthly // ignore: cast_nullable_to_non_nullable
                  as double,
        deadline: freezed == deadline
            ? _value.deadline
            : deadline // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalCardImpl implements _GoalCard {
  const _$GoalCardImpl({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.savedAmount,
    required this.progressPercent,
    required this.requiredMonthly,
    this.deadline,
  });

  factory _$GoalCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalCardImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double targetAmount;
  @override
  final double savedAmount;
  @override
  final double progressPercent;
  @override
  final double requiredMonthly;
  @override
  final String? deadline;

  @override
  String toString() {
    return 'GoalCard(id: $id, name: $name, targetAmount: $targetAmount, savedAmount: $savedAmount, progressPercent: $progressPercent, requiredMonthly: $requiredMonthly, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.savedAmount, savedAmount) ||
                other.savedAmount == savedAmount) &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent) &&
            (identical(other.requiredMonthly, requiredMonthly) ||
                other.requiredMonthly == requiredMonthly) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    targetAmount,
    savedAmount,
    progressPercent,
    requiredMonthly,
    deadline,
  );

  /// Create a copy of GoalCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalCardImplCopyWith<_$GoalCardImpl> get copyWith =>
      __$$GoalCardImplCopyWithImpl<_$GoalCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalCardImplToJson(this);
  }
}

abstract class _GoalCard implements GoalCard {
  const factory _GoalCard({
    required final int id,
    required final String name,
    required final double targetAmount,
    required final double savedAmount,
    required final double progressPercent,
    required final double requiredMonthly,
    final String? deadline,
  }) = _$GoalCardImpl;

  factory _GoalCard.fromJson(Map<String, dynamic> json) =
      _$GoalCardImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get targetAmount;
  @override
  double get savedAmount;
  @override
  double get progressPercent;
  @override
  double get requiredMonthly;
  @override
  String? get deadline;

  /// Create a copy of GoalCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalCardImplCopyWith<_$GoalCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionCard _$SubscriptionCardFromJson(Map<String, dynamic> json) {
  return _SubscriptionCard.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionCard {
  int get activeCount => throw _privateConstructorUsedError;
  double get totalMonthlyBurden => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionCardCopyWith<SubscriptionCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCardCopyWith<$Res> {
  factory $SubscriptionCardCopyWith(
    SubscriptionCard value,
    $Res Function(SubscriptionCard) then,
  ) = _$SubscriptionCardCopyWithImpl<$Res, SubscriptionCard>;
  @useResult
  $Res call({int activeCount, double totalMonthlyBurden});
}

/// @nodoc
class _$SubscriptionCardCopyWithImpl<$Res, $Val extends SubscriptionCard>
    implements $SubscriptionCardCopyWith<$Res> {
  _$SubscriptionCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeCount = null, Object? totalMonthlyBurden = null}) {
    return _then(
      _value.copyWith(
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
abstract class _$$SubscriptionCardImplCopyWith<$Res>
    implements $SubscriptionCardCopyWith<$Res> {
  factory _$$SubscriptionCardImplCopyWith(
    _$SubscriptionCardImpl value,
    $Res Function(_$SubscriptionCardImpl) then,
  ) = __$$SubscriptionCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeCount, double totalMonthlyBurden});
}

/// @nodoc
class __$$SubscriptionCardImplCopyWithImpl<$Res>
    extends _$SubscriptionCardCopyWithImpl<$Res, _$SubscriptionCardImpl>
    implements _$$SubscriptionCardImplCopyWith<$Res> {
  __$$SubscriptionCardImplCopyWithImpl(
    _$SubscriptionCardImpl _value,
    $Res Function(_$SubscriptionCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeCount = null, Object? totalMonthlyBurden = null}) {
    return _then(
      _$SubscriptionCardImpl(
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
class _$SubscriptionCardImpl implements _SubscriptionCard {
  const _$SubscriptionCardImpl({
    required this.activeCount,
    required this.totalMonthlyBurden,
  });

  factory _$SubscriptionCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionCardImplFromJson(json);

  @override
  final int activeCount;
  @override
  final double totalMonthlyBurden;

  @override
  String toString() {
    return 'SubscriptionCard(activeCount: $activeCount, totalMonthlyBurden: $totalMonthlyBurden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionCardImpl &&
            (identical(other.activeCount, activeCount) ||
                other.activeCount == activeCount) &&
            (identical(other.totalMonthlyBurden, totalMonthlyBurden) ||
                other.totalMonthlyBurden == totalMonthlyBurden));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, activeCount, totalMonthlyBurden);

  /// Create a copy of SubscriptionCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionCardImplCopyWith<_$SubscriptionCardImpl> get copyWith =>
      __$$SubscriptionCardImplCopyWithImpl<_$SubscriptionCardImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionCardImplToJson(this);
  }
}

abstract class _SubscriptionCard implements SubscriptionCard {
  const factory _SubscriptionCard({
    required final int activeCount,
    required final double totalMonthlyBurden,
  }) = _$SubscriptionCardImpl;

  factory _SubscriptionCard.fromJson(Map<String, dynamic> json) =
      _$SubscriptionCardImpl.fromJson;

  @override
  int get activeCount;
  @override
  double get totalMonthlyBurden;

  /// Create a copy of SubscriptionCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionCardImplCopyWith<_$SubscriptionCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryBanner _$SalaryBannerFromJson(Map<String, dynamic> json) {
  return _SalaryBanner.fromJson(json);
}

/// @nodoc
mixin _$SalaryBanner {
  double get amount => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  String get creditedAt => throw _privateConstructorUsedError;

  /// Serializes this SalaryBanner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalaryBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalaryBannerCopyWith<SalaryBanner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryBannerCopyWith<$Res> {
  factory $SalaryBannerCopyWith(
    SalaryBanner value,
    $Res Function(SalaryBanner) then,
  ) = _$SalaryBannerCopyWithImpl<$Res, SalaryBanner>;
  @useResult
  $Res call({double amount, String merchant, String creditedAt});
}

/// @nodoc
class _$SalaryBannerCopyWithImpl<$Res, $Val extends SalaryBanner>
    implements $SalaryBannerCopyWith<$Res> {
  _$SalaryBannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalaryBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? merchant = null,
    Object? creditedAt = null,
  }) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            merchant: null == merchant
                ? _value.merchant
                : merchant // ignore: cast_nullable_to_non_nullable
                      as String,
            creditedAt: null == creditedAt
                ? _value.creditedAt
                : creditedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SalaryBannerImplCopyWith<$Res>
    implements $SalaryBannerCopyWith<$Res> {
  factory _$$SalaryBannerImplCopyWith(
    _$SalaryBannerImpl value,
    $Res Function(_$SalaryBannerImpl) then,
  ) = __$$SalaryBannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String merchant, String creditedAt});
}

/// @nodoc
class __$$SalaryBannerImplCopyWithImpl<$Res>
    extends _$SalaryBannerCopyWithImpl<$Res, _$SalaryBannerImpl>
    implements _$$SalaryBannerImplCopyWith<$Res> {
  __$$SalaryBannerImplCopyWithImpl(
    _$SalaryBannerImpl _value,
    $Res Function(_$SalaryBannerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalaryBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? merchant = null,
    Object? creditedAt = null,
  }) {
    return _then(
      _$SalaryBannerImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        merchant: null == merchant
            ? _value.merchant
            : merchant // ignore: cast_nullable_to_non_nullable
                  as String,
        creditedAt: null == creditedAt
            ? _value.creditedAt
            : creditedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryBannerImpl implements _SalaryBanner {
  const _$SalaryBannerImpl({
    required this.amount,
    required this.merchant,
    required this.creditedAt,
  });

  factory _$SalaryBannerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryBannerImplFromJson(json);

  @override
  final double amount;
  @override
  final String merchant;
  @override
  final String creditedAt;

  @override
  String toString() {
    return 'SalaryBanner(amount: $amount, merchant: $merchant, creditedAt: $creditedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryBannerImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.creditedAt, creditedAt) ||
                other.creditedAt == creditedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, merchant, creditedAt);

  /// Create a copy of SalaryBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryBannerImplCopyWith<_$SalaryBannerImpl> get copyWith =>
      __$$SalaryBannerImplCopyWithImpl<_$SalaryBannerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryBannerImplToJson(this);
  }
}

abstract class _SalaryBanner implements SalaryBanner {
  const factory _SalaryBanner({
    required final double amount,
    required final String merchant,
    required final String creditedAt,
  }) = _$SalaryBannerImpl;

  factory _SalaryBanner.fromJson(Map<String, dynamic> json) =
      _$SalaryBannerImpl.fromJson;

  @override
  double get amount;
  @override
  String get merchant;
  @override
  String get creditedAt;

  /// Create a copy of SalaryBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalaryBannerImplCopyWith<_$SalaryBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) {
  return _DashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$DashboardResponse {
  double get currentBalance => throw _privateConstructorUsedError;
  double get monthlyIncome => throw _privateConstructorUsedError;
  double get monthlyExpenses => throw _privateConstructorUsedError;
  double get projectedMonthlyExpense => throw _privateConstructorUsedError;
  List<TransactionResponse> get recentTransactions =>
      throw _privateConstructorUsedError;
  List<BudgetCard> get budgets => throw _privateConstructorUsedError;
  List<GoalCard> get goals => throw _privateConstructorUsedError;
  SubscriptionCard get subscriptions => throw _privateConstructorUsedError;
  SalaryBanner? get salaryBanner => throw _privateConstructorUsedError;

  /// Serializes this DashboardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardResponseCopyWith<DashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardResponseCopyWith<$Res> {
  factory $DashboardResponseCopyWith(
    DashboardResponse value,
    $Res Function(DashboardResponse) then,
  ) = _$DashboardResponseCopyWithImpl<$Res, DashboardResponse>;
  @useResult
  $Res call({
    double currentBalance,
    double monthlyIncome,
    double monthlyExpenses,
    double projectedMonthlyExpense,
    List<TransactionResponse> recentTransactions,
    List<BudgetCard> budgets,
    List<GoalCard> goals,
    SubscriptionCard subscriptions,
    SalaryBanner? salaryBanner,
  });

  $SubscriptionCardCopyWith<$Res> get subscriptions;
  $SalaryBannerCopyWith<$Res>? get salaryBanner;
}

/// @nodoc
class _$DashboardResponseCopyWithImpl<$Res, $Val extends DashboardResponse>
    implements $DashboardResponseCopyWith<$Res> {
  _$DashboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? monthlyIncome = null,
    Object? monthlyExpenses = null,
    Object? projectedMonthlyExpense = null,
    Object? recentTransactions = null,
    Object? budgets = null,
    Object? goals = null,
    Object? subscriptions = null,
    Object? salaryBanner = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentBalance: null == currentBalance
                ? _value.currentBalance
                : currentBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            monthlyIncome: null == monthlyIncome
                ? _value.monthlyIncome
                : monthlyIncome // ignore: cast_nullable_to_non_nullable
                      as double,
            monthlyExpenses: null == monthlyExpenses
                ? _value.monthlyExpenses
                : monthlyExpenses // ignore: cast_nullable_to_non_nullable
                      as double,
            projectedMonthlyExpense: null == projectedMonthlyExpense
                ? _value.projectedMonthlyExpense
                : projectedMonthlyExpense // ignore: cast_nullable_to_non_nullable
                      as double,
            recentTransactions: null == recentTransactions
                ? _value.recentTransactions
                : recentTransactions // ignore: cast_nullable_to_non_nullable
                      as List<TransactionResponse>,
            budgets: null == budgets
                ? _value.budgets
                : budgets // ignore: cast_nullable_to_non_nullable
                      as List<BudgetCard>,
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<GoalCard>,
            subscriptions: null == subscriptions
                ? _value.subscriptions
                : subscriptions // ignore: cast_nullable_to_non_nullable
                      as SubscriptionCard,
            salaryBanner: freezed == salaryBanner
                ? _value.salaryBanner
                : salaryBanner // ignore: cast_nullable_to_non_nullable
                      as SalaryBanner?,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionCardCopyWith<$Res> get subscriptions {
    return $SubscriptionCardCopyWith<$Res>(_value.subscriptions, (value) {
      return _then(_value.copyWith(subscriptions: value) as $Val);
    });
  }

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalaryBannerCopyWith<$Res>? get salaryBanner {
    if (_value.salaryBanner == null) {
      return null;
    }

    return $SalaryBannerCopyWith<$Res>(_value.salaryBanner!, (value) {
      return _then(_value.copyWith(salaryBanner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardResponseImplCopyWith<$Res>
    implements $DashboardResponseCopyWith<$Res> {
  factory _$$DashboardResponseImplCopyWith(
    _$DashboardResponseImpl value,
    $Res Function(_$DashboardResponseImpl) then,
  ) = __$$DashboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double currentBalance,
    double monthlyIncome,
    double monthlyExpenses,
    double projectedMonthlyExpense,
    List<TransactionResponse> recentTransactions,
    List<BudgetCard> budgets,
    List<GoalCard> goals,
    SubscriptionCard subscriptions,
    SalaryBanner? salaryBanner,
  });

  @override
  $SubscriptionCardCopyWith<$Res> get subscriptions;
  @override
  $SalaryBannerCopyWith<$Res>? get salaryBanner;
}

/// @nodoc
class __$$DashboardResponseImplCopyWithImpl<$Res>
    extends _$DashboardResponseCopyWithImpl<$Res, _$DashboardResponseImpl>
    implements _$$DashboardResponseImplCopyWith<$Res> {
  __$$DashboardResponseImplCopyWithImpl(
    _$DashboardResponseImpl _value,
    $Res Function(_$DashboardResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? monthlyIncome = null,
    Object? monthlyExpenses = null,
    Object? projectedMonthlyExpense = null,
    Object? recentTransactions = null,
    Object? budgets = null,
    Object? goals = null,
    Object? subscriptions = null,
    Object? salaryBanner = freezed,
  }) {
    return _then(
      _$DashboardResponseImpl(
        currentBalance: null == currentBalance
            ? _value.currentBalance
            : currentBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        monthlyIncome: null == monthlyIncome
            ? _value.monthlyIncome
            : monthlyIncome // ignore: cast_nullable_to_non_nullable
                  as double,
        monthlyExpenses: null == monthlyExpenses
            ? _value.monthlyExpenses
            : monthlyExpenses // ignore: cast_nullable_to_non_nullable
                  as double,
        projectedMonthlyExpense: null == projectedMonthlyExpense
            ? _value.projectedMonthlyExpense
            : projectedMonthlyExpense // ignore: cast_nullable_to_non_nullable
                  as double,
        recentTransactions: null == recentTransactions
            ? _value._recentTransactions
            : recentTransactions // ignore: cast_nullable_to_non_nullable
                  as List<TransactionResponse>,
        budgets: null == budgets
            ? _value._budgets
            : budgets // ignore: cast_nullable_to_non_nullable
                  as List<BudgetCard>,
        goals: null == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<GoalCard>,
        subscriptions: null == subscriptions
            ? _value.subscriptions
            : subscriptions // ignore: cast_nullable_to_non_nullable
                  as SubscriptionCard,
        salaryBanner: freezed == salaryBanner
            ? _value.salaryBanner
            : salaryBanner // ignore: cast_nullable_to_non_nullable
                  as SalaryBanner?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardResponseImpl implements _DashboardResponse {
  const _$DashboardResponseImpl({
    required this.currentBalance,
    required this.monthlyIncome,
    required this.monthlyExpenses,
    required this.projectedMonthlyExpense,
    required final List<TransactionResponse> recentTransactions,
    required final List<BudgetCard> budgets,
    required final List<GoalCard> goals,
    required this.subscriptions,
    this.salaryBanner,
  }) : _recentTransactions = recentTransactions,
       _budgets = budgets,
       _goals = goals;

  factory _$DashboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardResponseImplFromJson(json);

  @override
  final double currentBalance;
  @override
  final double monthlyIncome;
  @override
  final double monthlyExpenses;
  @override
  final double projectedMonthlyExpense;
  final List<TransactionResponse> _recentTransactions;
  @override
  List<TransactionResponse> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  final List<BudgetCard> _budgets;
  @override
  List<BudgetCard> get budgets {
    if (_budgets is EqualUnmodifiableListView) return _budgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgets);
  }

  final List<GoalCard> _goals;
  @override
  List<GoalCard> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final SubscriptionCard subscriptions;
  @override
  final SalaryBanner? salaryBanner;

  @override
  String toString() {
    return 'DashboardResponse(currentBalance: $currentBalance, monthlyIncome: $monthlyIncome, monthlyExpenses: $monthlyExpenses, projectedMonthlyExpense: $projectedMonthlyExpense, recentTransactions: $recentTransactions, budgets: $budgets, goals: $goals, subscriptions: $subscriptions, salaryBanner: $salaryBanner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardResponseImpl &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.monthlyIncome, monthlyIncome) ||
                other.monthlyIncome == monthlyIncome) &&
            (identical(other.monthlyExpenses, monthlyExpenses) ||
                other.monthlyExpenses == monthlyExpenses) &&
            (identical(
                  other.projectedMonthlyExpense,
                  projectedMonthlyExpense,
                ) ||
                other.projectedMonthlyExpense == projectedMonthlyExpense) &&
            const DeepCollectionEquality().equals(
              other._recentTransactions,
              _recentTransactions,
            ) &&
            const DeepCollectionEquality().equals(other._budgets, _budgets) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.subscriptions, subscriptions) ||
                other.subscriptions == subscriptions) &&
            (identical(other.salaryBanner, salaryBanner) ||
                other.salaryBanner == salaryBanner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentBalance,
    monthlyIncome,
    monthlyExpenses,
    projectedMonthlyExpense,
    const DeepCollectionEquality().hash(_recentTransactions),
    const DeepCollectionEquality().hash(_budgets),
    const DeepCollectionEquality().hash(_goals),
    subscriptions,
    salaryBanner,
  );

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardResponseImplCopyWith<_$DashboardResponseImpl> get copyWith =>
      __$$DashboardResponseImplCopyWithImpl<_$DashboardResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardResponseImplToJson(this);
  }
}

abstract class _DashboardResponse implements DashboardResponse {
  const factory _DashboardResponse({
    required final double currentBalance,
    required final double monthlyIncome,
    required final double monthlyExpenses,
    required final double projectedMonthlyExpense,
    required final List<TransactionResponse> recentTransactions,
    required final List<BudgetCard> budgets,
    required final List<GoalCard> goals,
    required final SubscriptionCard subscriptions,
    final SalaryBanner? salaryBanner,
  }) = _$DashboardResponseImpl;

  factory _DashboardResponse.fromJson(Map<String, dynamic> json) =
      _$DashboardResponseImpl.fromJson;

  @override
  double get currentBalance;
  @override
  double get monthlyIncome;
  @override
  double get monthlyExpenses;
  @override
  double get projectedMonthlyExpense;
  @override
  List<TransactionResponse> get recentTransactions;
  @override
  List<BudgetCard> get budgets;
  @override
  List<GoalCard> get goals;
  @override
  SubscriptionCard get subscriptions;
  @override
  SalaryBanner? get salaryBanner;

  /// Create a copy of DashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardResponseImplCopyWith<_$DashboardResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankFeedResponse _$BankFeedResponseFromJson(Map<String, dynamic> json) {
  return _BankFeedResponse.fromJson(json);
}

/// @nodoc
mixin _$BankFeedResponse {
  int get transactionsAdded => throw _privateConstructorUsedError;
  List<TransactionResponse> get transactions =>
      throw _privateConstructorUsedError;
  String get syncedAt => throw _privateConstructorUsedError;
  String get nextSlotAvailableAt => throw _privateConstructorUsedError;

  /// Serializes this BankFeedResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankFeedResponseCopyWith<BankFeedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankFeedResponseCopyWith<$Res> {
  factory $BankFeedResponseCopyWith(
    BankFeedResponse value,
    $Res Function(BankFeedResponse) then,
  ) = _$BankFeedResponseCopyWithImpl<$Res, BankFeedResponse>;
  @useResult
  $Res call({
    int transactionsAdded,
    List<TransactionResponse> transactions,
    String syncedAt,
    String nextSlotAvailableAt,
  });
}

/// @nodoc
class _$BankFeedResponseCopyWithImpl<$Res, $Val extends BankFeedResponse>
    implements $BankFeedResponseCopyWith<$Res> {
  _$BankFeedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsAdded = null,
    Object? transactions = null,
    Object? syncedAt = null,
    Object? nextSlotAvailableAt = null,
  }) {
    return _then(
      _value.copyWith(
            transactionsAdded: null == transactionsAdded
                ? _value.transactionsAdded
                : transactionsAdded // ignore: cast_nullable_to_non_nullable
                      as int,
            transactions: null == transactions
                ? _value.transactions
                : transactions // ignore: cast_nullable_to_non_nullable
                      as List<TransactionResponse>,
            syncedAt: null == syncedAt
                ? _value.syncedAt
                : syncedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            nextSlotAvailableAt: null == nextSlotAvailableAt
                ? _value.nextSlotAvailableAt
                : nextSlotAvailableAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BankFeedResponseImplCopyWith<$Res>
    implements $BankFeedResponseCopyWith<$Res> {
  factory _$$BankFeedResponseImplCopyWith(
    _$BankFeedResponseImpl value,
    $Res Function(_$BankFeedResponseImpl) then,
  ) = __$$BankFeedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int transactionsAdded,
    List<TransactionResponse> transactions,
    String syncedAt,
    String nextSlotAvailableAt,
  });
}

/// @nodoc
class __$$BankFeedResponseImplCopyWithImpl<$Res>
    extends _$BankFeedResponseCopyWithImpl<$Res, _$BankFeedResponseImpl>
    implements _$$BankFeedResponseImplCopyWith<$Res> {
  __$$BankFeedResponseImplCopyWithImpl(
    _$BankFeedResponseImpl _value,
    $Res Function(_$BankFeedResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsAdded = null,
    Object? transactions = null,
    Object? syncedAt = null,
    Object? nextSlotAvailableAt = null,
  }) {
    return _then(
      _$BankFeedResponseImpl(
        transactionsAdded: null == transactionsAdded
            ? _value.transactionsAdded
            : transactionsAdded // ignore: cast_nullable_to_non_nullable
                  as int,
        transactions: null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                  as List<TransactionResponse>,
        syncedAt: null == syncedAt
            ? _value.syncedAt
            : syncedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        nextSlotAvailableAt: null == nextSlotAvailableAt
            ? _value.nextSlotAvailableAt
            : nextSlotAvailableAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BankFeedResponseImpl implements _BankFeedResponse {
  const _$BankFeedResponseImpl({
    required this.transactionsAdded,
    required final List<TransactionResponse> transactions,
    required this.syncedAt,
    required this.nextSlotAvailableAt,
  }) : _transactions = transactions;

  factory _$BankFeedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankFeedResponseImplFromJson(json);

  @override
  final int transactionsAdded;
  final List<TransactionResponse> _transactions;
  @override
  List<TransactionResponse> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final String syncedAt;
  @override
  final String nextSlotAvailableAt;

  @override
  String toString() {
    return 'BankFeedResponse(transactionsAdded: $transactionsAdded, transactions: $transactions, syncedAt: $syncedAt, nextSlotAvailableAt: $nextSlotAvailableAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankFeedResponseImpl &&
            (identical(other.transactionsAdded, transactionsAdded) ||
                other.transactionsAdded == transactionsAdded) &&
            const DeepCollectionEquality().equals(
              other._transactions,
              _transactions,
            ) &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt) &&
            (identical(other.nextSlotAvailableAt, nextSlotAvailableAt) ||
                other.nextSlotAvailableAt == nextSlotAvailableAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    transactionsAdded,
    const DeepCollectionEquality().hash(_transactions),
    syncedAt,
    nextSlotAvailableAt,
  );

  /// Create a copy of BankFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankFeedResponseImplCopyWith<_$BankFeedResponseImpl> get copyWith =>
      __$$BankFeedResponseImplCopyWithImpl<_$BankFeedResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BankFeedResponseImplToJson(this);
  }
}

abstract class _BankFeedResponse implements BankFeedResponse {
  const factory _BankFeedResponse({
    required final int transactionsAdded,
    required final List<TransactionResponse> transactions,
    required final String syncedAt,
    required final String nextSlotAvailableAt,
  }) = _$BankFeedResponseImpl;

  factory _BankFeedResponse.fromJson(Map<String, dynamic> json) =
      _$BankFeedResponseImpl.fromJson;

  @override
  int get transactionsAdded;
  @override
  List<TransactionResponse> get transactions;
  @override
  String get syncedAt;
  @override
  String get nextSlotAvailableAt;

  /// Create a copy of BankFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankFeedResponseImplCopyWith<_$BankFeedResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
