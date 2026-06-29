// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return _TransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionRequest {
  String get merchant => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get transactionDate => throw _privateConstructorUsedError;

  /// Serializes this TransactionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionRequestCopyWith<TransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRequestCopyWith<$Res> {
  factory $TransactionRequestCopyWith(
    TransactionRequest value,
    $Res Function(TransactionRequest) then,
  ) = _$TransactionRequestCopyWithImpl<$Res, TransactionRequest>;
  @useResult
  $Res call({
    String merchant,
    double amount,
    String type,
    String category,
    String? paymentMethod,
    String? transactionDate,
  });
}

/// @nodoc
class _$TransactionRequestCopyWithImpl<$Res, $Val extends TransactionRequest>
    implements $TransactionRequestCopyWith<$Res> {
  _$TransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchant = null,
    Object? amount = null,
    Object? type = null,
    Object? category = null,
    Object? paymentMethod = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            transactionDate: freezed == transactionDate
                ? _value.transactionDate
                : transactionDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionRequestImplCopyWith<$Res>
    implements $TransactionRequestCopyWith<$Res> {
  factory _$$TransactionRequestImplCopyWith(
    _$TransactionRequestImpl value,
    $Res Function(_$TransactionRequestImpl) then,
  ) = __$$TransactionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String merchant,
    double amount,
    String type,
    String category,
    String? paymentMethod,
    String? transactionDate,
  });
}

/// @nodoc
class __$$TransactionRequestImplCopyWithImpl<$Res>
    extends _$TransactionRequestCopyWithImpl<$Res, _$TransactionRequestImpl>
    implements _$$TransactionRequestImplCopyWith<$Res> {
  __$$TransactionRequestImplCopyWithImpl(
    _$TransactionRequestImpl _value,
    $Res Function(_$TransactionRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchant = null,
    Object? amount = null,
    Object? type = null,
    Object? category = null,
    Object? paymentMethod = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(
      _$TransactionRequestImpl(
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
        transactionDate: freezed == transactionDate
            ? _value.transactionDate
            : transactionDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionRequestImpl implements _TransactionRequest {
  const _$TransactionRequestImpl({
    required this.merchant,
    required this.amount,
    required this.type,
    required this.category,
    this.paymentMethod,
    this.transactionDate,
  });

  factory _$TransactionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionRequestImplFromJson(json);

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
  final String? transactionDate;

  @override
  String toString() {
    return 'TransactionRequest(merchant: $merchant, amount: $amount, type: $type, category: $category, paymentMethod: $paymentMethod, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionRequestImpl &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    merchant,
    amount,
    type,
    category,
    paymentMethod,
    transactionDate,
  );

  /// Create a copy of TransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionRequestImplCopyWith<_$TransactionRequestImpl> get copyWith =>
      __$$TransactionRequestImplCopyWithImpl<_$TransactionRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionRequestImplToJson(this);
  }
}

abstract class _TransactionRequest implements TransactionRequest {
  const factory _TransactionRequest({
    required final String merchant,
    required final double amount,
    required final String type,
    required final String category,
    final String? paymentMethod,
    final String? transactionDate,
  }) = _$TransactionRequestImpl;

  factory _TransactionRequest.fromJson(Map<String, dynamic> json) =
      _$TransactionRequestImpl.fromJson;

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
  String? get transactionDate;

  /// Create a copy of TransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionRequestImplCopyWith<_$TransactionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) {
  return _TransactionItem.fromJson(json);
}

/// @nodoc
mixin _$TransactionItem {
  int get id => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String get transactionDate => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionItemCopyWith<TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemCopyWith<$Res> {
  factory $TransactionItemCopyWith(
    TransactionItem value,
    $Res Function(TransactionItem) then,
  ) = _$TransactionItemCopyWithImpl<$Res, TransactionItem>;
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
class _$TransactionItemCopyWithImpl<$Res, $Val extends TransactionItem>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionItem
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
abstract class _$$TransactionItemImplCopyWith<$Res>
    implements $TransactionItemCopyWith<$Res> {
  factory _$$TransactionItemImplCopyWith(
    _$TransactionItemImpl value,
    $Res Function(_$TransactionItemImpl) then,
  ) = __$$TransactionItemImplCopyWithImpl<$Res>;
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
class __$$TransactionItemImplCopyWithImpl<$Res>
    extends _$TransactionItemCopyWithImpl<$Res, _$TransactionItemImpl>
    implements _$$TransactionItemImplCopyWith<$Res> {
  __$$TransactionItemImplCopyWithImpl(
    _$TransactionItemImpl _value,
    $Res Function(_$TransactionItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionItem
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
      _$TransactionItemImpl(
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
class _$TransactionItemImpl implements _TransactionItem {
  const _$TransactionItemImpl({
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

  factory _$TransactionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionItemImplFromJson(json);

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
    return 'TransactionItem(id: $id, merchant: $merchant, amount: $amount, type: $type, category: $category, paymentMethod: $paymentMethod, source: $source, transactionDate: $transactionDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionItemImpl &&
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

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionItemImplCopyWith<_$TransactionItemImpl> get copyWith =>
      __$$TransactionItemImplCopyWithImpl<_$TransactionItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionItemImplToJson(this);
  }
}

abstract class _TransactionItem implements TransactionItem {
  const factory _TransactionItem({
    required final int id,
    required final String merchant,
    required final double amount,
    required final String type,
    required final String category,
    final String? paymentMethod,
    final String? source,
    required final String transactionDate,
    required final String createdAt,
  }) = _$TransactionItemImpl;

  factory _TransactionItem.fromJson(Map<String, dynamic> json) =
      _$TransactionItemImpl.fromJson;

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

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionItemImplCopyWith<_$TransactionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionPage _$TransactionPageFromJson(Map<String, dynamic> json) {
  return _TransactionPage.fromJson(json);
}

/// @nodoc
mixin _$TransactionPage {
  List<TransactionItem> get content => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;

  /// Serializes this TransactionPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionPageCopyWith<TransactionPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPageCopyWith<$Res> {
  factory $TransactionPageCopyWith(
    TransactionPage value,
    $Res Function(TransactionPage) then,
  ) = _$TransactionPageCopyWithImpl<$Res, TransactionPage>;
  @useResult
  $Res call({
    List<TransactionItem> content,
    int totalElements,
    int totalPages,
    int number,
    bool last,
  });
}

/// @nodoc
class _$TransactionPageCopyWithImpl<$Res, $Val extends TransactionPage>
    implements $TransactionPageCopyWith<$Res> {
  _$TransactionPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? number = null,
    Object? last = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<TransactionItem>,
            totalElements: null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            last: null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionPageImplCopyWith<$Res>
    implements $TransactionPageCopyWith<$Res> {
  factory _$$TransactionPageImplCopyWith(
    _$TransactionPageImpl value,
    $Res Function(_$TransactionPageImpl) then,
  ) = __$$TransactionPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<TransactionItem> content,
    int totalElements,
    int totalPages,
    int number,
    bool last,
  });
}

/// @nodoc
class __$$TransactionPageImplCopyWithImpl<$Res>
    extends _$TransactionPageCopyWithImpl<$Res, _$TransactionPageImpl>
    implements _$$TransactionPageImplCopyWith<$Res> {
  __$$TransactionPageImplCopyWithImpl(
    _$TransactionPageImpl _value,
    $Res Function(_$TransactionPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? number = null,
    Object? last = null,
  }) {
    return _then(
      _$TransactionPageImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<TransactionItem>,
        totalElements: null == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        last: null == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionPageImpl implements _TransactionPage {
  const _$TransactionPageImpl({
    required final List<TransactionItem> content,
    required this.totalElements,
    required this.totalPages,
    required this.number,
    required this.last,
  }) : _content = content;

  factory _$TransactionPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionPageImplFromJson(json);

  final List<TransactionItem> _content;
  @override
  List<TransactionItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int totalElements;
  @override
  final int totalPages;
  @override
  final int number;
  @override
  final bool last;

  @override
  String toString() {
    return 'TransactionPage(content: $content, totalElements: $totalElements, totalPages: $totalPages, number: $number, last: $last)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionPageImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    totalElements,
    totalPages,
    number,
    last,
  );

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionPageImplCopyWith<_$TransactionPageImpl> get copyWith =>
      __$$TransactionPageImplCopyWithImpl<_$TransactionPageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionPageImplToJson(this);
  }
}

abstract class _TransactionPage implements TransactionPage {
  const factory _TransactionPage({
    required final List<TransactionItem> content,
    required final int totalElements,
    required final int totalPages,
    required final int number,
    required final bool last,
  }) = _$TransactionPageImpl;

  factory _TransactionPage.fromJson(Map<String, dynamic> json) =
      _$TransactionPageImpl.fromJson;

  @override
  List<TransactionItem> get content;
  @override
  int get totalElements;
  @override
  int get totalPages;
  @override
  int get number;
  @override
  bool get last;

  /// Create a copy of TransactionPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionPageImplCopyWith<_$TransactionPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
