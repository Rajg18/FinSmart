import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/analytics_models.dart';
import '../data/repositories/analytics_repository.dart';

part 'analytics_provider.g.dart';

// Selected month/year for breakdown + top merchants
@riverpod
class SelectedMonth extends _$SelectedMonth {
  @override
  ({int month, int year}) build() {
    final now = DateTime.now();
    return (month: now.month, year: now.year);
  }

  void set(int month, int year) => state = (month: month, year: year);
  void prev() {
    if (state.month == 1) {
      state = (month: 12, year: state.year - 1);
    } else {
      state = (month: state.month - 1, year: state.year);
    }
  }

  void next() {
    final now = DateTime.now();
    if (state.year == now.year && state.month == now.month) return;
    if (state.month == 12) {
      state = (month: 1, year: state.year + 1);
    } else {
      state = (month: state.month + 1, year: state.year);
    }
  }
}

// Trend window: 3, 6, or 12 months
@riverpod
class TrendMonths extends _$TrendMonths {
  @override
  int build() => 6;
  void set(int m) => state = m;
}

@riverpod
Future<CategoryBreakdownResponse> categoryBreakdown(Ref ref) {
  final sel = ref.watch(selectedMonthProvider);
  return ref
      .watch(analyticsRepositoryProvider)
      .getCategoryBreakdown(sel.month, sel.year);
}

@riverpod
Future<SpendingTrendResponse> spendingTrend(Ref ref) {
  final months = ref.watch(trendMonthsProvider);
  return ref.watch(analyticsRepositoryProvider).getSpendingTrend(months);
}

@riverpod
Future<TopMerchantsResponse> topMerchants(Ref ref) {
  final sel = ref.watch(selectedMonthProvider);
  return ref
      .watch(analyticsRepositoryProvider)
      .getTopMerchants(sel.month, sel.year, 8);
}

// Comparison: period1 = selectedMonth, period2 = month before it
@riverpod
Future<MonthlyComparisonResponse> monthlyComparison(Ref ref) {
  final sel = ref.watch(selectedMonthProvider);
  final prev = sel.month == 1
      ? (month: 12, year: sel.year - 1)
      : (month: sel.month - 1, year: sel.year);
  return ref
      .watch(analyticsRepositoryProvider)
      .getMonthlyComparison(prev.month, prev.year, sel.month, sel.year);
}
