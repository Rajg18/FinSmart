import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/goal_models.dart';
import '../data/repositories/goal_repository.dart';

part 'goal_provider.g.dart';

@riverpod
Future<List<GoalResponse>> goalList(Ref ref) =>
    ref.watch(goalRepositoryProvider).getAll();

@riverpod
class GoalNotifier extends _$GoalNotifier {
  @override
  String? build() => null;

  Future<String?> create(GoalRequest req) async {
    final result = await AsyncValue.guard(
        () => ref.read(goalRepositoryProvider).create(req));
    if (!result.hasError) {
      ref.invalidate(goalListProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> update(int id, GoalRequest req) async {
    final result = await AsyncValue.guard(
        () => ref.read(goalRepositoryProvider).update(id, req));
    if (!result.hasError) {
      ref.invalidate(goalListProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> allocate(int id, GoalAllocationRequest req) async {
    final result = await AsyncValue.guard(
        () => ref.read(goalRepositoryProvider).allocate(id, req));
    if (!result.hasError) {
      ref.invalidate(goalListProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> delete(int id) async {
    final result = await AsyncValue.guard(() async {
      await ref.read(goalRepositoryProvider).delete(id);
      return null;
    });
    if (!result.hasError) {
      ref.invalidate(goalListProvider);
      return null;
    }
    return result.error.toString();
  }
}
