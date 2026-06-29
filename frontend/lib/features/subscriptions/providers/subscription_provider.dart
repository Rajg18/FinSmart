import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/subscription_models.dart';
import '../data/repositories/subscription_repository.dart';

part 'subscription_provider.g.dart';

// Whether to show all subs or active-only
@riverpod
class ShowInactive extends _$ShowInactive {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

@riverpod
Future<SubscriptionSummaryResponse> subscriptionSummary(Ref ref) =>
    ref.watch(subscriptionRepositoryProvider).getSummary();

@riverpod
Future<List<SubscriptionResponse>> subscriptionList(Ref ref) {
  final showInactive = ref.watch(showInactiveProvider);
  return ref
      .watch(subscriptionRepositoryProvider)
      .getAll(activeOnly: !showInactive);
}

@riverpod
class SubscriptionNotifier extends _$SubscriptionNotifier {
  @override
  String? build() => null;

  void _invalidate() {
    ref.invalidate(subscriptionListProvider);
    ref.invalidate(subscriptionSummaryProvider);
  }

  Future<String?> create(SubscriptionRequest req) async {
    final result = await AsyncValue.guard(
        () => ref.read(subscriptionRepositoryProvider).create(req));
    if (!result.hasError) { _invalidate(); return null; }
    return result.error.toString();
  }

  Future<String?> update(int id, SubscriptionRequest req) async {
    final result = await AsyncValue.guard(
        () => ref.read(subscriptionRepositoryProvider).update(id, req));
    if (!result.hasError) { _invalidate(); return null; }
    return result.error.toString();
  }

  Future<String?> toggle(int id) async {
    final result = await AsyncValue.guard(
        () => ref.read(subscriptionRepositoryProvider).toggle(id));
    if (!result.hasError) { _invalidate(); return null; }
    return result.error.toString();
  }

  Future<String?> delete(int id) async {
    final result = await AsyncValue.guard(() async {
      await ref.read(subscriptionRepositoryProvider).delete(id);
      return null;
    });
    if (!result.hasError) { _invalidate(); return null; }
    return result.error.toString();
  }
}
