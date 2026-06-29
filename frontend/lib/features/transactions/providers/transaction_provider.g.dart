// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionPageHash() => r'c28d9064e64ee816de9b6de58d298ea9f2b8419d';

/// See also [transactionPage].
@ProviderFor(transactionPage)
final transactionPageProvider =
    AutoDisposeFutureProvider<TransactionPage>.internal(
      transactionPage,
      name: r'transactionPageProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$transactionPageHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionPageRef = AutoDisposeFutureProviderRef<TransactionPage>;
String _$transactionFilterHash() => r'3e99829c53dc656cb70cc596a3ae2d3a2ba3f599';

/// See also [TransactionFilter].
@ProviderFor(TransactionFilter)
final transactionFilterProvider =
    AutoDisposeNotifierProvider<
      TransactionFilter,
      ({String? type, String? category, int page})
    >.internal(
      TransactionFilter.new,
      name: r'transactionFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$transactionFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TransactionFilter =
    AutoDisposeNotifier<({String? type, String? category, int page})>;
String _$transactionNotifierHash() =>
    r'fdb81cfc83bc5306348fe198aebfffe38dc473db';

/// See also [TransactionNotifier].
@ProviderFor(TransactionNotifier)
final transactionNotifierProvider =
    AutoDisposeNotifierProvider<TransactionNotifier, String?>.internal(
      TransactionNotifier.new,
      name: r'transactionNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$transactionNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TransactionNotifier = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
