import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/budget_models.dart';
import '../data/repositories/budget_repository.dart';

part 'budget_provider.g.dart';

@riverpod
Future<List<BudgetResponse>> budgetList(Ref ref) =>
    ref.watch(budgetRepositoryProvider).getAll();

@riverpod
class BudgetNotifier extends _$BudgetNotifier {
  @override
  String? build() => null;

  Future<String?> create(BudgetRequest req) async {
    final result = await AsyncValue.guard(
      () => ref.read(budgetRepositoryProvider).create(req),
    );
    if (!result.hasError) {
      ref.invalidate(budgetListProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> update(int id, BudgetRequest req) async {
    final result = await AsyncValue.guard(
      () => ref.read(budgetRepositoryProvider).update(id, req),
    );
    if (!result.hasError) {
      ref.invalidate(budgetListProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> delete(int id) async {
    final result = await AsyncValue.guard(
      () async {
        await ref.read(budgetRepositoryProvider).delete(id);
        return null;
      },
    );
    if (!result.hasError) {
      ref.invalidate(budgetListProvider);
      return null;
    }
    return result.error.toString();
  }
}
