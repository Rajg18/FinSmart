import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/dashboard_models.dart';
import '../data/repositories/dashboard_repository.dart';

part 'dashboard_provider.g.dart';

@riverpod
Future<DashboardResponse> dashboard(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).getDashboard();
}

@riverpod
class BankFeedNotifier extends _$BankFeedNotifier {
  @override
  AsyncValue<BankFeedResponse?> build() => const AsyncData(null);

  Future<void> sync() async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => ref.read(dashboardRepositoryProvider).syncBankFeed(),
    );
    state = result;
    ref.invalidate(dashboardProvider);
  }
}
