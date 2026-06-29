// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryBreakdownItem _$CategoryBreakdownItemFromJson(
  Map<String, dynamic> json,
) {
  return _CategoryBreakdownItem.fromJson(json);
}

/// @nodoc
mixin _$CategoryBreakdownItem {
  String get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this CategoryBreakdownItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryBreakdownItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryBreakdownItemCopyWith<CategoryBreakdownItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBreakdownItemCopyWith<$Res> {
  factory $CategoryBreakdownItemCopyWith(
    CategoryBreakdownItem value,
    $Res Function(CategoryBreakdownItem) then,
  ) = _$CategoryBreakdownItemCopyWithImpl<$Res, CategoryBreakdownItem>;
  @useResult
  $Res call({String category, double amount, double percentage});
}

/// @nodoc
class _$CategoryBreakdownItemCopyWithImpl<
  $Res,
  $Val extends CategoryBreakdownItem
>
    implements $CategoryBreakdownItemCopyWith<$Res> {
  _$CategoryBreakdownItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryBreakdownItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(
      _value.copyWith(
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryBreakdownItemImplCopyWith<$Res>
    implements $CategoryBreakdownItemCopyWith<$Res> {
  factory _$$CategoryBreakdownItemImplCopyWith(
    _$CategoryBreakdownItemImpl value,
    $Res Function(_$CategoryBreakdownItemImpl) then,
  ) = __$$CategoryBreakdownItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, double amount, double percentage});
}

/// @nodoc
class __$$CategoryBreakdownItemImplCopyWithImpl<$Res>
    extends
        _$CategoryBreakdownItemCopyWithImpl<$Res, _$CategoryBreakdownItemImpl>
    implements _$$CategoryBreakdownItemImplCopyWith<$Res> {
  __$$CategoryBreakdownItemImplCopyWithImpl(
    _$CategoryBreakdownItemImpl _value,
    $Res Function(_$CategoryBreakdownItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryBreakdownItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(
      _$CategoryBreakdownItemImpl(
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryBreakdownItemImpl implements _CategoryBreakdownItem {
  const _$CategoryBreakdownItemImpl({
    required this.category,
    required this.amount,
    required this.percentage,
  });

  factory _$CategoryBreakdownItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryBreakdownItemImplFromJson(json);

  @override
  final String category;
  @override
  final double amount;
  @override
  final double percentage;

  @override
  String toString() {
    return 'CategoryBreakdownItem(category: $category, amount: $amount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryBreakdownItemImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, amount, percentage);

  /// Create a copy of CategoryBreakdownItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryBreakdownItemImplCopyWith<_$CategoryBreakdownItemImpl>
  get copyWith =>
      __$$CategoryBreakdownItemImplCopyWithImpl<_$CategoryBreakdownItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryBreakdownItemImplToJson(this);
  }
}

abstract class _CategoryBreakdownItem implements CategoryBreakdownItem {
  const factory _CategoryBreakdownItem({
    required final String category,
    required final double amount,
    required final double percentage,
  }) = _$CategoryBreakdownItemImpl;

  factory _CategoryBreakdownItem.fromJson(Map<String, dynamic> json) =
      _$CategoryBreakdownItemImpl.fromJson;

  @override
  String get category;
  @override
  double get amount;
  @override
  double get percentage;

  /// Create a copy of CategoryBreakdownItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryBreakdownItemImplCopyWith<_$CategoryBreakdownItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CategoryBreakdownResponse _$CategoryBreakdownResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CategoryBreakdownResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryBreakdownResponse {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  List<CategoryBreakdownItem> get breakdown =>
      throw _privateConstructorUsedError;

  /// Serializes this CategoryBreakdownResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryBreakdownResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryBreakdownResponseCopyWith<CategoryBreakdownResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBreakdownResponseCopyWith<$Res> {
  factory $CategoryBreakdownResponseCopyWith(
    CategoryBreakdownResponse value,
    $Res Function(CategoryBreakdownResponse) then,
  ) = _$CategoryBreakdownResponseCopyWithImpl<$Res, CategoryBreakdownResponse>;
  @useResult
  $Res call({
    int month,
    int year,
    double totalSpent,
    List<CategoryBreakdownItem> breakdown,
  });
}

/// @nodoc
class _$CategoryBreakdownResponseCopyWithImpl<
  $Res,
  $Val extends CategoryBreakdownResponse
>
    implements $CategoryBreakdownResponseCopyWith<$Res> {
  _$CategoryBreakdownResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryBreakdownResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? breakdown = null,
  }) {
    return _then(
      _value.copyWith(
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSpent: null == totalSpent
                ? _value.totalSpent
                : totalSpent // ignore: cast_nullable_to_non_nullable
                      as double,
            breakdown: null == breakdown
                ? _value.breakdown
                : breakdown // ignore: cast_nullable_to_non_nullable
                      as List<CategoryBreakdownItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryBreakdownResponseImplCopyWith<$Res>
    implements $CategoryBreakdownResponseCopyWith<$Res> {
  factory _$$CategoryBreakdownResponseImplCopyWith(
    _$CategoryBreakdownResponseImpl value,
    $Res Function(_$CategoryBreakdownResponseImpl) then,
  ) = __$$CategoryBreakdownResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int month,
    int year,
    double totalSpent,
    List<CategoryBreakdownItem> breakdown,
  });
}

/// @nodoc
class __$$CategoryBreakdownResponseImplCopyWithImpl<$Res>
    extends
        _$CategoryBreakdownResponseCopyWithImpl<
          $Res,
          _$CategoryBreakdownResponseImpl
        >
    implements _$$CategoryBreakdownResponseImplCopyWith<$Res> {
  __$$CategoryBreakdownResponseImplCopyWithImpl(
    _$CategoryBreakdownResponseImpl _value,
    $Res Function(_$CategoryBreakdownResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryBreakdownResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? breakdown = null,
  }) {
    return _then(
      _$CategoryBreakdownResponseImpl(
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSpent: null == totalSpent
            ? _value.totalSpent
            : totalSpent // ignore: cast_nullable_to_non_nullable
                  as double,
        breakdown: null == breakdown
            ? _value._breakdown
            : breakdown // ignore: cast_nullable_to_non_nullable
                  as List<CategoryBreakdownItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryBreakdownResponseImpl implements _CategoryBreakdownResponse {
  const _$CategoryBreakdownResponseImpl({
    required this.month,
    required this.year,
    required this.totalSpent,
    required final List<CategoryBreakdownItem> breakdown,
  }) : _breakdown = breakdown;

  factory _$CategoryBreakdownResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryBreakdownResponseImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  final double totalSpent;
  final List<CategoryBreakdownItem> _breakdown;
  @override
  List<CategoryBreakdownItem> get breakdown {
    if (_breakdown is EqualUnmodifiableListView) return _breakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakdown);
  }

  @override
  String toString() {
    return 'CategoryBreakdownResponse(month: $month, year: $year, totalSpent: $totalSpent, breakdown: $breakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryBreakdownResponseImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            const DeepCollectionEquality().equals(
              other._breakdown,
              _breakdown,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    month,
    year,
    totalSpent,
    const DeepCollectionEquality().hash(_breakdown),
  );

  /// Create a copy of CategoryBreakdownResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryBreakdownResponseImplCopyWith<_$CategoryBreakdownResponseImpl>
  get copyWith =>
      __$$CategoryBreakdownResponseImplCopyWithImpl<
        _$CategoryBreakdownResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryBreakdownResponseImplToJson(this);
  }
}

abstract class _CategoryBreakdownResponse implements CategoryBreakdownResponse {
  const factory _CategoryBreakdownResponse({
    required final int month,
    required final int year,
    required final double totalSpent,
    required final List<CategoryBreakdownItem> breakdown,
  }) = _$CategoryBreakdownResponseImpl;

  factory _CategoryBreakdownResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryBreakdownResponseImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  double get totalSpent;
  @override
  List<CategoryBreakdownItem> get breakdown;

  /// Create a copy of CategoryBreakdownResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryBreakdownResponseImplCopyWith<_$CategoryBreakdownResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MonthSummary _$MonthSummaryFromJson(Map<String, dynamic> json) {
  return _MonthSummary.fromJson(json);
}

/// @nodoc
mixin _$MonthSummary {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this MonthSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthSummaryCopyWith<MonthSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthSummaryCopyWith<$Res> {
  factory $MonthSummaryCopyWith(
    MonthSummary value,
    $Res Function(MonthSummary) then,
  ) = _$MonthSummaryCopyWithImpl<$Res, MonthSummary>;
  @useResult
  $Res call({
    int month,
    int year,
    double totalSpent,
    double totalIncome,
    int transactionCount,
  });
}

/// @nodoc
class _$MonthSummaryCopyWithImpl<$Res, $Val extends MonthSummary>
    implements $MonthSummaryCopyWith<$Res> {
  _$MonthSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? totalIncome = null,
    Object? transactionCount = null,
  }) {
    return _then(
      _value.copyWith(
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSpent: null == totalSpent
                ? _value.totalSpent
                : totalSpent // ignore: cast_nullable_to_non_nullable
                      as double,
            totalIncome: null == totalIncome
                ? _value.totalIncome
                : totalIncome // ignore: cast_nullable_to_non_nullable
                      as double,
            transactionCount: null == transactionCount
                ? _value.transactionCount
                : transactionCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthSummaryImplCopyWith<$Res>
    implements $MonthSummaryCopyWith<$Res> {
  factory _$$MonthSummaryImplCopyWith(
    _$MonthSummaryImpl value,
    $Res Function(_$MonthSummaryImpl) then,
  ) = __$$MonthSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int month,
    int year,
    double totalSpent,
    double totalIncome,
    int transactionCount,
  });
}

/// @nodoc
class __$$MonthSummaryImplCopyWithImpl<$Res>
    extends _$MonthSummaryCopyWithImpl<$Res, _$MonthSummaryImpl>
    implements _$$MonthSummaryImplCopyWith<$Res> {
  __$$MonthSummaryImplCopyWithImpl(
    _$MonthSummaryImpl _value,
    $Res Function(_$MonthSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? totalIncome = null,
    Object? transactionCount = null,
  }) {
    return _then(
      _$MonthSummaryImpl(
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSpent: null == totalSpent
            ? _value.totalSpent
            : totalSpent // ignore: cast_nullable_to_non_nullable
                  as double,
        totalIncome: null == totalIncome
            ? _value.totalIncome
            : totalIncome // ignore: cast_nullable_to_non_nullable
                  as double,
        transactionCount: null == transactionCount
            ? _value.transactionCount
            : transactionCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthSummaryImpl implements _MonthSummary {
  const _$MonthSummaryImpl({
    required this.month,
    required this.year,
    required this.totalSpent,
    required this.totalIncome,
    required this.transactionCount,
  });

  factory _$MonthSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthSummaryImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  final double totalSpent;
  @override
  final double totalIncome;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'MonthSummary(month: $month, year: $year, totalSpent: $totalSpent, totalIncome: $totalIncome, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthSummaryImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    month,
    year,
    totalSpent,
    totalIncome,
    transactionCount,
  );

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthSummaryImplCopyWith<_$MonthSummaryImpl> get copyWith =>
      __$$MonthSummaryImplCopyWithImpl<_$MonthSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthSummaryImplToJson(this);
  }
}

abstract class _MonthSummary implements MonthSummary {
  const factory _MonthSummary({
    required final int month,
    required final int year,
    required final double totalSpent,
    required final double totalIncome,
    required final int transactionCount,
  }) = _$MonthSummaryImpl;

  factory _MonthSummary.fromJson(Map<String, dynamic> json) =
      _$MonthSummaryImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  double get totalSpent;
  @override
  double get totalIncome;
  @override
  int get transactionCount;

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthSummaryImplCopyWith<_$MonthSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyComparisonResponse _$MonthlyComparisonResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MonthlyComparisonResponse.fromJson(json);
}

/// @nodoc
mixin _$MonthlyComparisonResponse {
  MonthSummary get period1 => throw _privateConstructorUsedError;
  MonthSummary get period2 => throw _privateConstructorUsedError;
  double get difference => throw _privateConstructorUsedError;
  double get changePercent => throw _privateConstructorUsedError;

  /// Serializes this MonthlyComparisonResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyComparisonResponseCopyWith<MonthlyComparisonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyComparisonResponseCopyWith<$Res> {
  factory $MonthlyComparisonResponseCopyWith(
    MonthlyComparisonResponse value,
    $Res Function(MonthlyComparisonResponse) then,
  ) = _$MonthlyComparisonResponseCopyWithImpl<$Res, MonthlyComparisonResponse>;
  @useResult
  $Res call({
    MonthSummary period1,
    MonthSummary period2,
    double difference,
    double changePercent,
  });

  $MonthSummaryCopyWith<$Res> get period1;
  $MonthSummaryCopyWith<$Res> get period2;
}

/// @nodoc
class _$MonthlyComparisonResponseCopyWithImpl<
  $Res,
  $Val extends MonthlyComparisonResponse
>
    implements $MonthlyComparisonResponseCopyWith<$Res> {
  _$MonthlyComparisonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period1 = null,
    Object? period2 = null,
    Object? difference = null,
    Object? changePercent = null,
  }) {
    return _then(
      _value.copyWith(
            period1: null == period1
                ? _value.period1
                : period1 // ignore: cast_nullable_to_non_nullable
                      as MonthSummary,
            period2: null == period2
                ? _value.period2
                : period2 // ignore: cast_nullable_to_non_nullable
                      as MonthSummary,
            difference: null == difference
                ? _value.difference
                : difference // ignore: cast_nullable_to_non_nullable
                      as double,
            changePercent: null == changePercent
                ? _value.changePercent
                : changePercent // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthSummaryCopyWith<$Res> get period1 {
    return $MonthSummaryCopyWith<$Res>(_value.period1, (value) {
      return _then(_value.copyWith(period1: value) as $Val);
    });
  }

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthSummaryCopyWith<$Res> get period2 {
    return $MonthSummaryCopyWith<$Res>(_value.period2, (value) {
      return _then(_value.copyWith(period2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlyComparisonResponseImplCopyWith<$Res>
    implements $MonthlyComparisonResponseCopyWith<$Res> {
  factory _$$MonthlyComparisonResponseImplCopyWith(
    _$MonthlyComparisonResponseImpl value,
    $Res Function(_$MonthlyComparisonResponseImpl) then,
  ) = __$$MonthlyComparisonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MonthSummary period1,
    MonthSummary period2,
    double difference,
    double changePercent,
  });

  @override
  $MonthSummaryCopyWith<$Res> get period1;
  @override
  $MonthSummaryCopyWith<$Res> get period2;
}

/// @nodoc
class __$$MonthlyComparisonResponseImplCopyWithImpl<$Res>
    extends
        _$MonthlyComparisonResponseCopyWithImpl<
          $Res,
          _$MonthlyComparisonResponseImpl
        >
    implements _$$MonthlyComparisonResponseImplCopyWith<$Res> {
  __$$MonthlyComparisonResponseImplCopyWithImpl(
    _$MonthlyComparisonResponseImpl _value,
    $Res Function(_$MonthlyComparisonResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period1 = null,
    Object? period2 = null,
    Object? difference = null,
    Object? changePercent = null,
  }) {
    return _then(
      _$MonthlyComparisonResponseImpl(
        period1: null == period1
            ? _value.period1
            : period1 // ignore: cast_nullable_to_non_nullable
                  as MonthSummary,
        period2: null == period2
            ? _value.period2
            : period2 // ignore: cast_nullable_to_non_nullable
                  as MonthSummary,
        difference: null == difference
            ? _value.difference
            : difference // ignore: cast_nullable_to_non_nullable
                  as double,
        changePercent: null == changePercent
            ? _value.changePercent
            : changePercent // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyComparisonResponseImpl implements _MonthlyComparisonResponse {
  const _$MonthlyComparisonResponseImpl({
    required this.period1,
    required this.period2,
    required this.difference,
    required this.changePercent,
  });

  factory _$MonthlyComparisonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyComparisonResponseImplFromJson(json);

  @override
  final MonthSummary period1;
  @override
  final MonthSummary period2;
  @override
  final double difference;
  @override
  final double changePercent;

  @override
  String toString() {
    return 'MonthlyComparisonResponse(period1: $period1, period2: $period2, difference: $difference, changePercent: $changePercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyComparisonResponseImpl &&
            (identical(other.period1, period1) || other.period1 == period1) &&
            (identical(other.period2, period2) || other.period2 == period2) &&
            (identical(other.difference, difference) ||
                other.difference == difference) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, period1, period2, difference, changePercent);

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyComparisonResponseImplCopyWith<_$MonthlyComparisonResponseImpl>
  get copyWith =>
      __$$MonthlyComparisonResponseImplCopyWithImpl<
        _$MonthlyComparisonResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyComparisonResponseImplToJson(this);
  }
}

abstract class _MonthlyComparisonResponse implements MonthlyComparisonResponse {
  const factory _MonthlyComparisonResponse({
    required final MonthSummary period1,
    required final MonthSummary period2,
    required final double difference,
    required final double changePercent,
  }) = _$MonthlyComparisonResponseImpl;

  factory _MonthlyComparisonResponse.fromJson(Map<String, dynamic> json) =
      _$MonthlyComparisonResponseImpl.fromJson;

  @override
  MonthSummary get period1;
  @override
  MonthSummary get period2;
  @override
  double get difference;
  @override
  double get changePercent;

  /// Create a copy of MonthlyComparisonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyComparisonResponseImplCopyWith<_$MonthlyComparisonResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MonthlyPoint _$MonthlyPointFromJson(Map<String, dynamic> json) {
  return _MonthlyPoint.fromJson(json);
}

/// @nodoc
mixin _$MonthlyPoint {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;

  /// Serializes this MonthlyPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyPointCopyWith<MonthlyPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyPointCopyWith<$Res> {
  factory $MonthlyPointCopyWith(
    MonthlyPoint value,
    $Res Function(MonthlyPoint) then,
  ) = _$MonthlyPointCopyWithImpl<$Res, MonthlyPoint>;
  @useResult
  $Res call({int month, int year, double totalSpent, double totalIncome});
}

/// @nodoc
class _$MonthlyPointCopyWithImpl<$Res, $Val extends MonthlyPoint>
    implements $MonthlyPointCopyWith<$Res> {
  _$MonthlyPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? totalIncome = null,
  }) {
    return _then(
      _value.copyWith(
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSpent: null == totalSpent
                ? _value.totalSpent
                : totalSpent // ignore: cast_nullable_to_non_nullable
                      as double,
            totalIncome: null == totalIncome
                ? _value.totalIncome
                : totalIncome // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyPointImplCopyWith<$Res>
    implements $MonthlyPointCopyWith<$Res> {
  factory _$$MonthlyPointImplCopyWith(
    _$MonthlyPointImpl value,
    $Res Function(_$MonthlyPointImpl) then,
  ) = __$$MonthlyPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, int year, double totalSpent, double totalIncome});
}

/// @nodoc
class __$$MonthlyPointImplCopyWithImpl<$Res>
    extends _$MonthlyPointCopyWithImpl<$Res, _$MonthlyPointImpl>
    implements _$$MonthlyPointImplCopyWith<$Res> {
  __$$MonthlyPointImplCopyWithImpl(
    _$MonthlyPointImpl _value,
    $Res Function(_$MonthlyPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? totalIncome = null,
  }) {
    return _then(
      _$MonthlyPointImpl(
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSpent: null == totalSpent
            ? _value.totalSpent
            : totalSpent // ignore: cast_nullable_to_non_nullable
                  as double,
        totalIncome: null == totalIncome
            ? _value.totalIncome
            : totalIncome // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyPointImpl implements _MonthlyPoint {
  const _$MonthlyPointImpl({
    required this.month,
    required this.year,
    required this.totalSpent,
    required this.totalIncome,
  });

  factory _$MonthlyPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyPointImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  final double totalSpent;
  @override
  final double totalIncome;

  @override
  String toString() {
    return 'MonthlyPoint(month: $month, year: $year, totalSpent: $totalSpent, totalIncome: $totalIncome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyPointImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, month, year, totalSpent, totalIncome);

  /// Create a copy of MonthlyPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyPointImplCopyWith<_$MonthlyPointImpl> get copyWith =>
      __$$MonthlyPointImplCopyWithImpl<_$MonthlyPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyPointImplToJson(this);
  }
}

abstract class _MonthlyPoint implements MonthlyPoint {
  const factory _MonthlyPoint({
    required final int month,
    required final int year,
    required final double totalSpent,
    required final double totalIncome,
  }) = _$MonthlyPointImpl;

  factory _MonthlyPoint.fromJson(Map<String, dynamic> json) =
      _$MonthlyPointImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  double get totalSpent;
  @override
  double get totalIncome;

  /// Create a copy of MonthlyPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyPointImplCopyWith<_$MonthlyPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpendingTrendResponse _$SpendingTrendResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SpendingTrendResponse.fromJson(json);
}

/// @nodoc
mixin _$SpendingTrendResponse {
  List<MonthlyPoint> get trend => throw _privateConstructorUsedError;

  /// Serializes this SpendingTrendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpendingTrendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpendingTrendResponseCopyWith<SpendingTrendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingTrendResponseCopyWith<$Res> {
  factory $SpendingTrendResponseCopyWith(
    SpendingTrendResponse value,
    $Res Function(SpendingTrendResponse) then,
  ) = _$SpendingTrendResponseCopyWithImpl<$Res, SpendingTrendResponse>;
  @useResult
  $Res call({List<MonthlyPoint> trend});
}

/// @nodoc
class _$SpendingTrendResponseCopyWithImpl<
  $Res,
  $Val extends SpendingTrendResponse
>
    implements $SpendingTrendResponseCopyWith<$Res> {
  _$SpendingTrendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpendingTrendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? trend = null}) {
    return _then(
      _value.copyWith(
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyPoint>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpendingTrendResponseImplCopyWith<$Res>
    implements $SpendingTrendResponseCopyWith<$Res> {
  factory _$$SpendingTrendResponseImplCopyWith(
    _$SpendingTrendResponseImpl value,
    $Res Function(_$SpendingTrendResponseImpl) then,
  ) = __$$SpendingTrendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MonthlyPoint> trend});
}

/// @nodoc
class __$$SpendingTrendResponseImplCopyWithImpl<$Res>
    extends
        _$SpendingTrendResponseCopyWithImpl<$Res, _$SpendingTrendResponseImpl>
    implements _$$SpendingTrendResponseImplCopyWith<$Res> {
  __$$SpendingTrendResponseImplCopyWithImpl(
    _$SpendingTrendResponseImpl _value,
    $Res Function(_$SpendingTrendResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpendingTrendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? trend = null}) {
    return _then(
      _$SpendingTrendResponseImpl(
        trend: null == trend
            ? _value._trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyPoint>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingTrendResponseImpl implements _SpendingTrendResponse {
  const _$SpendingTrendResponseImpl({required final List<MonthlyPoint> trend})
    : _trend = trend;

  factory _$SpendingTrendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingTrendResponseImplFromJson(json);

  final List<MonthlyPoint> _trend;
  @override
  List<MonthlyPoint> get trend {
    if (_trend is EqualUnmodifiableListView) return _trend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trend);
  }

  @override
  String toString() {
    return 'SpendingTrendResponse(trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingTrendResponseImpl &&
            const DeepCollectionEquality().equals(other._trend, _trend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_trend));

  /// Create a copy of SpendingTrendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingTrendResponseImplCopyWith<_$SpendingTrendResponseImpl>
  get copyWith =>
      __$$SpendingTrendResponseImplCopyWithImpl<_$SpendingTrendResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingTrendResponseImplToJson(this);
  }
}

abstract class _SpendingTrendResponse implements SpendingTrendResponse {
  const factory _SpendingTrendResponse({
    required final List<MonthlyPoint> trend,
  }) = _$SpendingTrendResponseImpl;

  factory _SpendingTrendResponse.fromJson(Map<String, dynamic> json) =
      _$SpendingTrendResponseImpl.fromJson;

  @override
  List<MonthlyPoint> get trend;

  /// Create a copy of SpendingTrendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpendingTrendResponseImplCopyWith<_$SpendingTrendResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MerchantStat _$MerchantStatFromJson(Map<String, dynamic> json) {
  return _MerchantStat.fromJson(json);
}

/// @nodoc
mixin _$MerchantStat {
  String get merchant => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this MerchantStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantStatCopyWith<MerchantStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantStatCopyWith<$Res> {
  factory $MerchantStatCopyWith(
    MerchantStat value,
    $Res Function(MerchantStat) then,
  ) = _$MerchantStatCopyWithImpl<$Res, MerchantStat>;
  @useResult
  $Res call({String merchant, double totalSpent, int transactionCount});
}

/// @nodoc
class _$MerchantStatCopyWithImpl<$Res, $Val extends MerchantStat>
    implements $MerchantStatCopyWith<$Res> {
  _$MerchantStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchant = null,
    Object? totalSpent = null,
    Object? transactionCount = null,
  }) {
    return _then(
      _value.copyWith(
            merchant: null == merchant
                ? _value.merchant
                : merchant // ignore: cast_nullable_to_non_nullable
                      as String,
            totalSpent: null == totalSpent
                ? _value.totalSpent
                : totalSpent // ignore: cast_nullable_to_non_nullable
                      as double,
            transactionCount: null == transactionCount
                ? _value.transactionCount
                : transactionCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MerchantStatImplCopyWith<$Res>
    implements $MerchantStatCopyWith<$Res> {
  factory _$$MerchantStatImplCopyWith(
    _$MerchantStatImpl value,
    $Res Function(_$MerchantStatImpl) then,
  ) = __$$MerchantStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String merchant, double totalSpent, int transactionCount});
}

/// @nodoc
class __$$MerchantStatImplCopyWithImpl<$Res>
    extends _$MerchantStatCopyWithImpl<$Res, _$MerchantStatImpl>
    implements _$$MerchantStatImplCopyWith<$Res> {
  __$$MerchantStatImplCopyWithImpl(
    _$MerchantStatImpl _value,
    $Res Function(_$MerchantStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MerchantStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchant = null,
    Object? totalSpent = null,
    Object? transactionCount = null,
  }) {
    return _then(
      _$MerchantStatImpl(
        merchant: null == merchant
            ? _value.merchant
            : merchant // ignore: cast_nullable_to_non_nullable
                  as String,
        totalSpent: null == totalSpent
            ? _value.totalSpent
            : totalSpent // ignore: cast_nullable_to_non_nullable
                  as double,
        transactionCount: null == transactionCount
            ? _value.transactionCount
            : transactionCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantStatImpl implements _MerchantStat {
  const _$MerchantStatImpl({
    required this.merchant,
    required this.totalSpent,
    required this.transactionCount,
  });

  factory _$MerchantStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantStatImplFromJson(json);

  @override
  final String merchant;
  @override
  final double totalSpent;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'MerchantStat(merchant: $merchant, totalSpent: $totalSpent, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantStatImpl &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, merchant, totalSpent, transactionCount);

  /// Create a copy of MerchantStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantStatImplCopyWith<_$MerchantStatImpl> get copyWith =>
      __$$MerchantStatImplCopyWithImpl<_$MerchantStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantStatImplToJson(this);
  }
}

abstract class _MerchantStat implements MerchantStat {
  const factory _MerchantStat({
    required final String merchant,
    required final double totalSpent,
    required final int transactionCount,
  }) = _$MerchantStatImpl;

  factory _MerchantStat.fromJson(Map<String, dynamic> json) =
      _$MerchantStatImpl.fromJson;

  @override
  String get merchant;
  @override
  double get totalSpent;
  @override
  int get transactionCount;

  /// Create a copy of MerchantStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantStatImplCopyWith<_$MerchantStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopMerchantsResponse _$TopMerchantsResponseFromJson(Map<String, dynamic> json) {
  return _TopMerchantsResponse.fromJson(json);
}

/// @nodoc
mixin _$TopMerchantsResponse {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  List<MerchantStat> get merchants => throw _privateConstructorUsedError;

  /// Serializes this TopMerchantsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopMerchantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopMerchantsResponseCopyWith<TopMerchantsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopMerchantsResponseCopyWith<$Res> {
  factory $TopMerchantsResponseCopyWith(
    TopMerchantsResponse value,
    $Res Function(TopMerchantsResponse) then,
  ) = _$TopMerchantsResponseCopyWithImpl<$Res, TopMerchantsResponse>;
  @useResult
  $Res call({int month, int year, List<MerchantStat> merchants});
}

/// @nodoc
class _$TopMerchantsResponseCopyWithImpl<
  $Res,
  $Val extends TopMerchantsResponse
>
    implements $TopMerchantsResponseCopyWith<$Res> {
  _$TopMerchantsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopMerchantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? merchants = null,
  }) {
    return _then(
      _value.copyWith(
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            merchants: null == merchants
                ? _value.merchants
                : merchants // ignore: cast_nullable_to_non_nullable
                      as List<MerchantStat>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopMerchantsResponseImplCopyWith<$Res>
    implements $TopMerchantsResponseCopyWith<$Res> {
  factory _$$TopMerchantsResponseImplCopyWith(
    _$TopMerchantsResponseImpl value,
    $Res Function(_$TopMerchantsResponseImpl) then,
  ) = __$$TopMerchantsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, int year, List<MerchantStat> merchants});
}

/// @nodoc
class __$$TopMerchantsResponseImplCopyWithImpl<$Res>
    extends _$TopMerchantsResponseCopyWithImpl<$Res, _$TopMerchantsResponseImpl>
    implements _$$TopMerchantsResponseImplCopyWith<$Res> {
  __$$TopMerchantsResponseImplCopyWithImpl(
    _$TopMerchantsResponseImpl _value,
    $Res Function(_$TopMerchantsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopMerchantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? merchants = null,
  }) {
    return _then(
      _$TopMerchantsResponseImpl(
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        merchants: null == merchants
            ? _value._merchants
            : merchants // ignore: cast_nullable_to_non_nullable
                  as List<MerchantStat>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopMerchantsResponseImpl implements _TopMerchantsResponse {
  const _$TopMerchantsResponseImpl({
    required this.month,
    required this.year,
    required final List<MerchantStat> merchants,
  }) : _merchants = merchants;

  factory _$TopMerchantsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopMerchantsResponseImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  final List<MerchantStat> _merchants;
  @override
  List<MerchantStat> get merchants {
    if (_merchants is EqualUnmodifiableListView) return _merchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchants);
  }

  @override
  String toString() {
    return 'TopMerchantsResponse(month: $month, year: $year, merchants: $merchants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopMerchantsResponseImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(
              other._merchants,
              _merchants,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    month,
    year,
    const DeepCollectionEquality().hash(_merchants),
  );

  /// Create a copy of TopMerchantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopMerchantsResponseImplCopyWith<_$TopMerchantsResponseImpl>
  get copyWith =>
      __$$TopMerchantsResponseImplCopyWithImpl<_$TopMerchantsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TopMerchantsResponseImplToJson(this);
  }
}

abstract class _TopMerchantsResponse implements TopMerchantsResponse {
  const factory _TopMerchantsResponse({
    required final int month,
    required final int year,
    required final List<MerchantStat> merchants,
  }) = _$TopMerchantsResponseImpl;

  factory _TopMerchantsResponse.fromJson(Map<String, dynamic> json) =
      _$TopMerchantsResponseImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  List<MerchantStat> get merchants;

  /// Create a copy of TopMerchantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopMerchantsResponseImplCopyWith<_$TopMerchantsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
