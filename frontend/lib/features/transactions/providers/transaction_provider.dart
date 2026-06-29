import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/transaction_models.dart';
import '../data/repositories/transaction_repository.dart';

part 'transaction_provider.g.dart';

// Filter state
@riverpod
class TransactionFilter extends _$TransactionFilter {
  @override
  ({String? type, String? category, int page}) build() =>
      (type: null, category: null, page: 0);

  void setType(String? type) =>
      state = (type: type, category: state.category, page: 0);

  void setCategory(String? category) =>
      state = (type: state.type, category: category, page: 0);

  void nextPage() =>
      state = (type: state.type, category: state.category, page: state.page + 1);

  void prevPage() =>
      state = (type: state.type, category: state.category, page: state.page - 1);

  void reset() => state = (type: null, category: null, page: 0);
}

// Paginated transaction list
@riverpod
Future<TransactionPage> transactionPage(Ref ref) {
  final filter = ref.watch(transactionFilterProvider);
  return ref.watch(transactionRepositoryProvider).getAll(
    type: filter.type,
    category: filter.category,
    page: filter.page,
  );
}

// CRUD notifier
@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  @override
  String? build() => null;

  Future<String?> create(TransactionRequest req) async {
    final result = await AsyncValue.guard(
      () => ref.read(transactionRepositoryProvider).create(req),
    );
    if (!result.hasError) {
      ref.invalidate(transactionPageProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> update(int id, TransactionRequest req) async {
    final result = await AsyncValue.guard(
      () => ref.read(transactionRepositoryProvider).update(id, req),
    );
    if (!result.hasError) {
      ref.invalidate(transactionPageProvider);
      return null;
    }
    return result.error.toString();
  }

  Future<String?> delete(int id) async {
    final result = await AsyncValue.guard(
      () async {
        await ref.read(transactionRepositoryProvider).delete(id);
        return null;
      },
    );
    if (!result.hasError) {
      ref.invalidate(transactionPageProvider);
      return null;
    }
    return result.error.toString();
  }
}
