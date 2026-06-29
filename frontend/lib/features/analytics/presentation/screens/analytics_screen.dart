import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../data/models/analytics_models.dart';
import '../../providers/analytics_provider.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sel = ref.watch(selectedMonthProvider);
    final now = DateTime.now();
    final isCurrentMonth = sel.month == now.month && sel.year == now.year;
    final monthLabel = DateFormat('MMMM yyyy')
        .format(DateTime(sel.year, sel.month));

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header + month picker
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Analytics', style: AppTextStyles.displayMedium),
                    Text('Spending insights & trends',
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
                const Spacer(),
                // Month navigator
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.surfaceBorder),
                  ),
                  child: Row(
                    children: [
                      _NavBtn(
                        icon: Icons.chevron_left_rounded,
                        onTap: () =>
                            ref.read(selectedMonthProvider.notifier).prev(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(monthLabel,
                            style: AppTextStyles.labelLarge),
                      ),
                      _NavBtn(
                        icon: Icons.chevron_right_rounded,
                        onTap: isCurrentMonth
                            ? null
                            : () => ref
                                .read(selectedMonthProvider.notifier)
                                .next(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Row 1: Comparison cards + Trend chart
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: comparison + top merchants stacked
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _ComparisonSection(ref: ref),
                      const SizedBox(height: 16),
                      _TopMerchantsSection(ref: ref),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Right: trend chart
                Expanded(
                  flex: 3,
                  child: _TrendSection(ref: ref),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Row 2: Category breakdown (pie + list)
            _CategorySection(ref: ref),
          ],
        ),
      ),
    );
  }
}

// ── Month nav button ──────────────────────────────────────────────────────────
class _NavBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _NavBtn({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon,
            size: 20,
            color: onTap == null
                ? AppColors.textMuted
                : AppColors.textSecondary),
      ),
    );
  }
}

// ── Monthly comparison ────────────────────────────────────────────────────────
class _ComparisonSection extends ConsumerWidget {
  final WidgetRef ref;
  const _ComparisonSection({required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(monthlyComparisonProvider);
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('vs Previous Month', style: AppTextStyles.headingMedium),
          const SizedBox(height: 16),
          async.when(
            loading: () => const Center(
                child:
                    CircularProgressIndicator(color: AppColors.accent)),
            error: (e, _) => Text(e.toString(),
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.danger)),
            data: (data) => _ComparisonBody(data: data),
          ),
        ],
      ),
    );
  }
}

class _ComparisonBody extends StatelessWidget {
  final MonthlyComparisonResponse data;
  const _ComparisonBody({required this.data});

  @override
  Widget build(BuildContext context) {
    final p1 = data.period1;
    final p2 = data.period2;
    final isIncrease = data.difference > 0;
    final changeColor =
        isIncrease ? AppColors.danger : AppColors.success;
    final changeIcon = isIncrease
        ? Icons.arrow_upward_rounded
        : Icons.arrow_downward_rounded;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _PeriodTile(
                    label: _monthName(p1.month, p1.year),
                    spent: p1.totalSpent,
                    income: p1.totalIncome,
                    txCount: p1.transactionCount)),
            Container(
                width: 1, height: 60, color: AppColors.surfaceBorder),
            Expanded(
                child: _PeriodTile(
                    label: _monthName(p2.month, p2.year),
                    spent: p2.totalSpent,
                    income: p2.totalIncome,
                    txCount: p2.transactionCount,
                    highlight: true)),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: changeColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: changeColor.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(changeIcon, size: 14, color: changeColor),
              const SizedBox(width: 6),
              Text(
                '${Formatters.currency(data.difference.abs())} (${data.changePercent.abs().toStringAsFixed(1)}%) ${isIncrease ? 'more' : 'less'} spent',
                style: AppTextStyles.labelMedium
                    .copyWith(color: changeColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _monthName(int month, int year) =>
      DateFormat('MMM yy').format(DateTime(year, month));
}

class _PeriodTile extends StatelessWidget {
  final String label;
  final double spent;
  final double income;
  final int txCount;
  final bool highlight;
  const _PeriodTile(
      {required this.label,
      required this.spent,
      required this.income,
      required this.txCount,
      this.highlight = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(label,
              style: AppTextStyles.caption.copyWith(
                  color: highlight
                      ? AppColors.accent
                      : AppColors.textSecondary,
                  fontWeight: highlight ? FontWeight.w600 : null)),
          const SizedBox(height: 6),
          Text(Formatters.currency(spent),
              style: AppTextStyles.moneySmall
                  .copyWith(color: AppColors.danger, fontSize: 13)),
          Text(Formatters.currency(income),
              style: AppTextStyles.moneySmall
                  .copyWith(color: AppColors.success, fontSize: 12)),
          Text('$txCount txns', style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

// ── Top merchants ─────────────────────────────────────────────────────────────
class _TopMerchantsSection extends ConsumerWidget {
  final WidgetRef ref;
  const _TopMerchantsSection({required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(topMerchantsProvider);
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Merchants', style: AppTextStyles.headingMedium),
          const SizedBox(height: 14),
          async.when(
            loading: () => const Center(
                child:
                    CircularProgressIndicator(color: AppColors.accent)),
            error: (e, _) => Text(e.toString(),
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.danger)),
            data: (data) => data.merchants.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text('No data for this month',
                          style: AppTextStyles.bodyMedium),
                    ),
                  )
                : _MerchantList(merchants: data.merchants),
          ),
        ],
      ),
    );
  }
}

class _MerchantList extends StatelessWidget {
  final List<MerchantStat> merchants;
  const _MerchantList({required this.merchants});

  @override
  Widget build(BuildContext context) {
    final max =
        merchants.isEmpty ? 1.0 : merchants.first.totalSpent;
    return Column(
      children: merchants.asMap().entries.map((e) {
        final rank = e.key + 1;
        final m = e.value;
        final barPct = max > 0 ? m.totalSpent / max : 0.0;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text('$rank',
                        style: AppTextStyles.caption.copyWith(
                            color: rank == 1
                                ? AppColors.warning
                                : AppColors.textMuted)),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(m.merchant,
                        style: AppTextStyles.labelMedium,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(Formatters.currency(m.totalSpent),
                      style: AppTextStyles.moneySmall
                          .copyWith(fontSize: 12)),
                  const SizedBox(width: 8),
                  Text('${m.transactionCount}x',
                      style: AppTextStyles.caption),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: barPct,
                  minHeight: 3,
                  backgroundColor: AppColors.surfaceBorder,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    rank == 1
                        ? AppColors.warning
                        : AppColors.accent.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── Spending trend bar chart ───────────────────────────────────────────────────
class _TrendSection extends ConsumerWidget {
  final WidgetRef ref;
  const _TrendSection({required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendAsync = ref.watch(spendingTrendProvider);
    final months = ref.watch(trendMonthsProvider);

    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Income vs Expenses', style: AppTextStyles.headingMedium),
              const Spacer(),
              // Window selector
              ...([3, 6, 12]).map((m) => Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: GestureDetector(
                      onTap: () =>
                          ref.read(trendMonthsProvider.notifier).set(m),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: months == m
                              ? AppColors.accent.withValues(alpha: 0.15)
                              : AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: months == m
                                ? AppColors.accent.withValues(alpha: 0.4)
                                : AppColors.surfaceBorder,
                          ),
                        ),
                        child: Text('${m}M',
                            style: AppTextStyles.caption.copyWith(
                              color: months == m
                                  ? AppColors.accent
                                  : AppColors.textSecondary,
                              fontWeight: months == m
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            )),
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 12),
          // Legend
          Row(
            children: [
              _LegendDot(color: AppColors.danger, label: 'Expenses'),
              const SizedBox(width: 16),
              _LegendDot(color: AppColors.success, label: 'Income'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: trendAsync.when(
              loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.accent)),
              error: (e, _) => Center(
                  child: Text(e.toString(),
                      style: AppTextStyles.caption
                          .copyWith(color: AppColors.danger))),
              data: (data) => data.trend.isEmpty
                  ? const Center(child: Text('No trend data'))
                  : _TrendChart(points: data.trend),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}

class _TrendChart extends StatelessWidget {
  final List<MonthlyPoint> points;
  const _TrendChart({required this.points});

  @override
  Widget build(BuildContext context) {
    final maxVal = points.fold(
            0.0,
            (m, p) => [m, p.totalSpent, p.totalIncome]
                .reduce((a, b) => a > b ? a : b)) *
        1.15;

    return BarChart(
      BarChartData(
        maxY: maxVal > 0 ? maxVal : 1000,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => AppColors.surfaceElevated,
            tooltipRoundedRadius: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final label = rodIndex == 0 ? 'Expense' : 'Income';
              final color =
                  rodIndex == 0 ? AppColors.danger : AppColors.success;
              return BarTooltipItem(
                '$label\n${Formatters.currency(rod.toY)}',
                AppTextStyles.caption.copyWith(color: color),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final i = value.toInt();
                if (i < 0 || i >= points.length) {
                  return const SizedBox.shrink();
                }
                final p = points[i];
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    DateFormat('MMM').format(DateTime(p.year, p.month)),
                    style: AppTextStyles.caption
                        .copyWith(color: AppColors.textMuted, fontSize: 10),
                  ),
                );
              },
              reservedSize: 28,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 52,
              getTitlesWidget: (value, meta) => Text(
                Formatters.compactCurrency(value),
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textMuted, fontSize: 9),
              ),
            ),
          ),
          topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) => FlLine(
            color: AppColors.surfaceBorder,
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: points.asMap().entries.map((e) {
          final i = e.key;
          final p = e.value;
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: p.totalSpent,
                color: AppColors.danger.withValues(alpha: 0.8),
                width: 10,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4)),
              ),
              BarChartRodData(
                toY: p.totalIncome,
                color: AppColors.success.withValues(alpha: 0.8),
                width: 10,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4)),
              ),
            ],
            barsSpace: 4,
          );
        }).toList(),
      ),
    );
  }
}

// ── Category breakdown ────────────────────────────────────────────────────────
class _CategorySection extends ConsumerWidget {
  final WidgetRef ref;
  const _CategorySection({required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(categoryBreakdownProvider);

    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Category Breakdown',
                  style: AppTextStyles.headingMedium),
              const Spacer(),
              async.when(
                data: (d) => Text(
                    'Total: ${Formatters.currency(d.totalSpent)}',
                    style: AppTextStyles.labelMedium
                        .copyWith(color: AppColors.textSecondary)),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          async.when(
            loading: () => const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child:
                  CircularProgressIndicator(color: AppColors.accent),
            )),
            error: (e, _) => Center(
                child: Text(e.toString(),
                    style: AppTextStyles.caption
                        .copyWith(color: AppColors.danger))),
            data: (data) => data.breakdown.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text('No spending data for this month'),
                    ),
                  )
                : _CategoryBody(data: data),
          ),
        ],
      ),
    );
  }
}

class _CategoryBody extends StatefulWidget {
  final CategoryBreakdownResponse data;
  const _CategoryBody({required this.data});

  @override
  State<_CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<_CategoryBody> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final items = widget.data.breakdown;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Pie chart
        SizedBox(
          width: 220,
          height: 220,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (event, response) {
                  if (!event.isInterestedForInteractions ||
                      response == null ||
                      response.touchedSection == null) {
                    setState(() => _touchedIndex = -1);
                    return;
                  }
                  setState(() => _touchedIndex =
                      response.touchedSection!.touchedSectionIndex);
                },
              ),
              sectionsSpace: 2,
              centerSpaceRadius: 48,
              sections: items.asMap().entries.map((e) {
                final i = e.key;
                final item = e.value;
                final isTouched = i == _touchedIndex;
                final color = _catColor(item.category);
                return PieChartSectionData(
                  value: item.amount,
                  color: color,
                  radius: isTouched ? 70 : 56,
                  title: isTouched
                      ? '${item.percentage.toStringAsFixed(1)}%'
                      : '',
                  titleStyle: AppTextStyles.caption.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(width: 32),

        // Legend + amounts
        Expanded(
          child: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: items.asMap().entries.map((e) {
              final i = e.key;
              final item = e.value;
              final isTouched = i == _touchedIndex;
              final color = _catColor(item.category);
              return GestureDetector(
                onTap: () => setState(() =>
                    _touchedIndex = _touchedIndex == i ? -1 : i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: isTouched
                        ? color.withValues(alpha: 0.12)
                        : AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isTouched
                          ? color.withValues(alpha: 0.4)
                          : AppColors.surfaceBorder,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_catLabel(item.category),
                              style: AppTextStyles.caption.copyWith(
                                  color: isTouched
                                      ? AppColors.textPrimary
                                      : AppColors.textSecondary)),
                          Text(Formatters.currency(item.amount),
                              style: AppTextStyles.moneySmall
                                  .copyWith(
                                      fontSize: 11,
                                      color: isTouched
                                          ? color
                                          : AppColors.textPrimary)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────────
String _catLabel(String cat) =>
    cat[0] + cat.substring(1).toLowerCase().replaceAll('_', ' ');

Color _catColor(String cat) => switch (cat) {
      'FOOD' => AppColors.catFood,
      'TRANSPORT' => AppColors.catTransport,
      'GROCERIES' => AppColors.catSalary,
      'SHOPPING' => AppColors.catShopping,
      'HEALTHCARE' => AppColors.catHealth,
      'ENTERTAINMENT' => AppColors.catEntertainment,
      'EDUCATION' => AppColors.accentLight,
      'SUBSCRIPTION' => AppColors.accent,
      'UTILITIES' => AppColors.warning,
      'SAVINGS' => AppColors.success,
      'INCOME' => const Color(0xFF06B6D4),
      _ => AppColors.catOther,
    };
