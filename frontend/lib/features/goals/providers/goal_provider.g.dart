// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goalListHash() => r'79387c3458e3fe88b9650143e5c46e4f3ecb4f62';

/// See also [goalList].
@ProviderFor(goalList)
final goalListProvider = AutoDisposeFutureProvider<List<GoalResponse>>.internal(
  goalList,
  name: r'goalListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$goalListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoalListRef = AutoDisposeFutureProviderRef<List<GoalResponse>>;
String _$goalNotifierHash() => r'86b2dcf2b61448ad5ff83f23fbb226840211c3e0';

/// See also [GoalNotifier].
@ProviderFor(GoalNotifier)
final goalNotifierProvider =
    AutoDisposeNotifierProvider<GoalNotifier, String?>.internal(
      GoalNotifier.new,
      name: r'goalNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$goalNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GoalNotifier = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
