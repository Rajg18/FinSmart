// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionSummaryHash() =>
    r'ffe734427a90d85796a0b0b39537f1f86444cfb4';

/// See also [subscriptionSummary].
@ProviderFor(subscriptionSummary)
final subscriptionSummaryProvider =
    AutoDisposeFutureProvider<SubscriptionSummaryResponse>.internal(
      subscriptionSummary,
      name: r'subscriptionSummaryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionSummaryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionSummaryRef =
    AutoDisposeFutureProviderRef<SubscriptionSummaryResponse>;
String _$subscriptionListHash() => r'f0b151c19c3f8fda7199694956457073dcdaa08e';

/// See also [subscriptionList].
@ProviderFor(subscriptionList)
final subscriptionListProvider =
    AutoDisposeFutureProvider<List<SubscriptionResponse>>.internal(
      subscriptionList,
      name: r'subscriptionListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionListRef =
    AutoDisposeFutureProviderRef<List<SubscriptionResponse>>;
String _$showInactiveHash() => r'939eea7a5faa753da048b6fe9e2079a6d1ec54cc';

/// See also [ShowInactive].
@ProviderFor(ShowInactive)
final showInactiveProvider =
    AutoDisposeNotifierProvider<ShowInactive, bool>.internal(
      ShowInactive.new,
      name: r'showInactiveProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$showInactiveHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ShowInactive = AutoDisposeNotifier<bool>;
String _$subscriptionNotifierHash() =>
    r'9e1e0572edff8b55bb6a9bba6567f45436bf7912';

/// See also [SubscriptionNotifier].
@ProviderFor(SubscriptionNotifier)
final subscriptionNotifierProvider =
    AutoDisposeNotifierProvider<SubscriptionNotifier, String?>.internal(
      SubscriptionNotifier.new,
      name: r'subscriptionNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SubscriptionNotifier = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
