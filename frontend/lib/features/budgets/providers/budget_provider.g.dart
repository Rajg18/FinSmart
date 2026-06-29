// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetListHash() => r'75ffd328522c0e288d98b14dca0351fd8e3142f7';

/// See also [budgetList].
@ProviderFor(budgetList)
final budgetListProvider =
    AutoDisposeFutureProvider<List<BudgetResponse>>.internal(
      budgetList,
      name: r'budgetListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$budgetListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BudgetListRef = AutoDisposeFutureProviderRef<List<BudgetResponse>>;
String _$budgetNotifierHash() => r'99b27f18722961455cef6d3325bf176fa0b15327';

/// See also [BudgetNotifier].
@ProviderFor(BudgetNotifier)
final budgetNotifierProvider =
    AutoDisposeNotifierProvider<BudgetNotifier, String?>.internal(
      BudgetNotifier.new,
      name: r'budgetNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$budgetNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BudgetNotifier = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
