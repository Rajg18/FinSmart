// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardHash() => r'5534ee8b2bd9cf9cd5cd14b8a429eb01fb679aed';

/// See also [dashboard].
@ProviderFor(dashboard)
final dashboardProvider = AutoDisposeFutureProvider<DashboardResponse>.internal(
  dashboard,
  name: r'dashboardProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardRef = AutoDisposeFutureProviderRef<DashboardResponse>;
String _$bankFeedNotifierHash() => r'e75bc52107bae13a615cc5292177fe626d0dc2cd';

/// See also [BankFeedNotifier].
@ProviderFor(BankFeedNotifier)
final bankFeedNotifierProvider =
    AutoDisposeNotifierProvider<
      BankFeedNotifier,
      AsyncValue<BankFeedResponse?>
    >.internal(
      BankFeedNotifier.new,
      name: r'bankFeedNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bankFeedNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BankFeedNotifier = AutoDisposeNotifier<AsyncValue<BankFeedResponse?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
