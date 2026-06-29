import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/loading_overlay.dart';
import '../../data/models/dashboard_models.dart';
import '../../providers/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashAsync = ref.watch(dashboardProvider);
    final bankFeedState = ref.watch(bankFeedNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: dashAsync.when(
        loading: () => const FinSmartLoader(),
        error: (e, _) => _ErrorView(message: e.toString(), onRetry: () => ref.invalidate(dashboardProvider)),
        data: (data) => LoadingOverlay(
          isLoading: bankFeedState.isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(onSync: () => ref.read(bankFeedNotifierProvider.notifier).sync()),
                const SizedBox(height: 24),
                if (data.salaryBanner != null) ...[
                  _SalaryBanner(banner: data.salaryBanner!),
                  const SizedBox(height: 20),
                ],
                _SummaryCards(data: data),
                const SizedBox(height: 24),

                // Left: Recent Transactions full height | Right: Budget → Goals → Subscriptions
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column — Recent Transactions spans full height
                    Expanded(
                      flex: 3,
                      child: _RecentTransactions(transactions: data.recentTransactions),
                    ),
                    const SizedBox(width: 20),
                    // Right column — all three stacked, same width
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _BudgetOverview(budgets: data.budgets),
                          const SizedBox(height: 20),
                          _GoalsOverview(goals: data.goals),
                          const SizedBox(height: 20),
                          _SubscriptionSummary(card: data.subscriptions),
                        ],
                      ),
                    ),
                  ],
                ),

                if (bankFeedState.hasValue && bankFeedState.value != null)
                  _BankFeedResult(feed: bankFeedState.value!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Header ──────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  final VoidCallback onSync;
  const _Header({required this.onSync});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard', style: AppTextStyles.displayMedium),
            Text('Your financial snapshot', style: AppTextStyles.bodyMedium),
          ],
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: onSync,
          icon: const Icon(Icons.sync_rounded, size: 16),
          label: const Text('Sync Bank Feed'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.accentLight,
            side: const BorderSide(color: AppColors.surfaceBorder),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ],
    );
  }
}

// ── Salary Banner ────────────────────────────────────────────────────────────
class _SalaryBanner extends StatelessWidget {
  final SalaryBanner banner;
  const _SalaryBanner({required this.banner});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      gradient: const LinearGradient(
        colors: [Color(0xFF064E3B), Color(0xFF065F46)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.account_balance_rounded, color: AppColors.success, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Salary Credited', style: AppTextStyles.labelMedium.copyWith(color: AppColors.successLight)),
                Text('${banner.merchant} • ${_formatDate(banner.creditedAt)}',
                    style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          Text(Formatters.currency(banner.amount),
              style: AppTextStyles.moneyMedium.copyWith(color: AppColors.success)),
        ],
      ),
    );
  }

  String _formatDate(String dt) {
    try {
      return Formatters.dateMedium(DateTime.parse(dt));
    } catch (_) {
      return dt;
    }
  }
}

// ── Summary Cards ────────────────────────────────────────────────────────────
class _SummaryCards extends StatelessWidget {
  final DashboardResponse data;
  const _SummaryCards({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _MetricCard(
          label: 'Current Balance',
          value: Formatters.currency(data.currentBalance),
          icon: Icons.account_balance_wallet_rounded,
          iconColor: AppColors.accentLight,
          valueColor: AppColors.textPrimary,
        )),
        const SizedBox(width: 16),
        Expanded(child: _MetricCard(
          label: 'Monthly Income',
          value: Formatters.currency(data.monthlyIncome),
          icon: Icons.trending_up_rounded,
          iconColor: AppColors.success,
          valueColor: AppColors.success,
        )),
        const SizedBox(width: 16),
        Expanded(child: _MetricCard(
          label: 'Monthly Expenses',
          value: Formatters.currency(data.monthlyExpenses),
          icon: Icons.trending_down_rounded,
          iconColor: AppColors.danger,
          valueColor: AppColors.danger,
        )),
        const SizedBox(width: 16),
        Expanded(child: _MetricCard(
          label: 'Projected Spend',
          value: Formatters.currency(data.projectedMonthlyExpense),
          icon: Icons.insights_rounded,
          iconColor: AppColors.warning,
          valueColor: AppColors.warning,
          subtitle: 'End of month forecast',
        )),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color valueColor;
  final String? subtitle;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.valueColor,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 16),
          Text(label, style: AppTextStyles.bodySmall),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.moneyMedium.copyWith(color: valueColor, fontSize: 18)),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(subtitle!, style: AppTextStyles.caption),
          ],
        ],
      ),
    );
  }
}

// ── Recent Transactions ───────────────────────────────────────────────────────
class _RecentTransactions extends StatelessWidget {
  final List<TransactionResponse> transactions;
  const _RecentTransactions({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Recent Transactions', style: AppTextStyles.headingMedium),
              const Spacer(),
              Text('Last 10', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          if (transactions.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(child: Text('No transactions yet', style: AppTextStyles.bodyMedium)),
            )
          else
            ...transactions.map((t) => _TransactionTile(transaction: t)),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final TransactionResponse transaction;
  const _TransactionTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isCredit = transaction.type == 'CREDIT';
    final color = isCredit ? AppColors.success : AppColors.danger;
    final categoryColor = _categoryColor(transaction.category);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: categoryColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_categoryIcon(transaction.category), color: categoryColor, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.merchant, style: AppTextStyles.labelLarge, overflow: TextOverflow.ellipsis),
                Text(_formatCategory(transaction.category), style: AppTextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isCredit ? '+' : '-'}${Formatters.currency(transaction.amount)}',
                style: AppTextStyles.moneySmall.copyWith(color: color),
              ),
              Text(_formatDate(transaction.transactionDate), style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(String dt) {
    try { return Formatters.dateShort(DateTime.parse(dt)); } catch (_) { return dt; }
  }

  String _formatCategory(String cat) =>
      cat.replaceAll('_', ' ').toLowerCase().split(' ')
          .map((w) => w.isEmpty ? '' : w[0].toUpperCase() + w.substring(1))
          .join(' ');

  Color _categoryColor(String cat) {
    return switch (cat) {
      'FOOD_AND_DINING' => AppColors.catFood,
      'TRANSPORTATION' => AppColors.catTransport,
      'SHOPPING' => AppColors.catShopping,
      'HEALTH_AND_FITNESS' => AppColors.catHealth,
      'ENTERTAINMENT' => AppColors.catEntertainment,
      'SALARY' || 'INCOME' => AppColors.catSalary,
      _ => AppColors.catOther,
    };
  }

  IconData _categoryIcon(String cat) {
    return switch (cat) {
      'FOOD_AND_DINING' => Icons.restaurant_rounded,
      'TRANSPORTATION' => Icons.directions_car_rounded,
      'SHOPPING' => Icons.shopping_bag_rounded,
      'HEALTH_AND_FITNESS' => Icons.favorite_rounded,
      'ENTERTAINMENT' => Icons.movie_rounded,
      'SALARY' || 'INCOME' => Icons.account_balance_rounded,
      'UTILITIES' => Icons.bolt_rounded,
      'TRAVEL' => Icons.flight_rounded,
      _ => Icons.receipt_rounded,
    };
  }
}

// ── Budget Overview ───────────────────────────────────────────────────────────
class _BudgetOverview extends StatelessWidget {
  final List<BudgetCard> budgets;
  const _BudgetOverview({required this.budgets});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Budgets', style: AppTextStyles.headingMedium),
          const SizedBox(height: 16),
          if (budgets.isEmpty)
            Text('No budgets set', style: AppTextStyles.bodyMedium)
          else
            ...budgets.take(4).map((b) => _BudgetRow(budget: b)),
        ],
      ),
    );
  }
}

class _BudgetRow extends StatelessWidget {
  final BudgetCard budget;
  const _BudgetRow({required this.budget});

  @override
  Widget build(BuildContext context) {
    final pct = budget.percentageUsed.clamp(0, 100) / 100;
    final color = budget.percentageUsed >= 100
        ? AppColors.danger
        : budget.percentageUsed >= 80
            ? AppColors.warning
            : AppColors.success;
    final label = budget.category.replaceAll('_', ' ').toLowerCase().split(' ')
        .map((w) => w.isEmpty ? '' : w[0].toUpperCase() + w.substring(1)).join(' ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: AppTextStyles.labelLarge),
              const Spacer(),
              Text('${budget.percentageUsed.toStringAsFixed(0)}%',
                  style: AppTextStyles.bodySmall.copyWith(color: color)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct.toDouble(),
              backgroundColor: AppColors.surfaceElevated,
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${Formatters.currency(budget.spentAmount)} / ${Formatters.currency(budget.limitAmount)}',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

// ── Goals Overview ────────────────────────────────────────────────────────────
class _GoalsOverview extends StatelessWidget {
  final List<GoalCard> goals;
  const _GoalsOverview({required this.goals});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Goals', style: AppTextStyles.headingMedium),
              const Spacer(),
              Text('In Progress', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 16),
          if (goals.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('No active goals', style: AppTextStyles.bodyMedium),
            )
          else
            ...goals.take(3).map((g) => _GoalRow(goal: g)),
        ],
      ),
    );
  }
}

class _GoalRow extends StatelessWidget {
  final GoalCard goal;
  const _GoalRow({required this.goal});

  @override
  Widget build(BuildContext context) {
    final pct = goal.progressPercent.clamp(0, 100) / 100;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(goal.name,
                    style: AppTextStyles.labelLarge,
                    overflow: TextOverflow.ellipsis),
              ),
              Text('${goal.progressPercent.toStringAsFixed(0)}%',
                  style: AppTextStyles.bodySmall
                      .copyWith(color: AppColors.accentLight)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct.toDouble(),
              backgroundColor: AppColors.surfaceElevated,
              valueColor: const AlwaysStoppedAnimation(AppColors.accent),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '${Formatters.currency(goal.savedAmount)} / ${Formatters.currency(goal.targetAmount)}',
                style: AppTextStyles.caption,
              ),
              const Spacer(),
              Text('₹${goal.requiredMonthly.toStringAsFixed(0)}/mo',
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.accentLight)),
            ],
          ),
        ],
      ),
    );
  }
}


// ── Subscription Summary ──────────────────────────────────────────────────────
class _SubscriptionSummary extends StatelessWidget {
  final SubscriptionCard card;
  const _SubscriptionSummary({required this.card});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Subscriptions', style: AppTextStyles.headingMedium),
              const Spacer(),
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: AppColors.catEntertainment.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.repeat_rounded, color: AppColors.catEntertainment, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Formatters.currency(card.totalMonthlyBurden),
                style: AppTextStyles.moneyMedium.copyWith(color: AppColors.catEntertainment),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text('/ month', style: AppTextStyles.caption),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${card.activeCount} active subscription${card.activeCount == 1 ? '' : 's'} running',
            style: AppTextStyles.bodySmall,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.catEntertainment.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.catEntertainment.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded, size: 14, color: AppColors.catEntertainment),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Reminders sent 3 days before renewal',
                    style: AppTextStyles.caption.copyWith(color: AppColors.catEntertainment),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bank Feed Result ──────────────────────────────────────────────────────────
class _BankFeedResult extends StatelessWidget {
  final BankFeedResponse feed;
  const _BankFeedResult({required this.feed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppCard(
        padding: const EdgeInsets.all(20),
        border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
            const SizedBox(width: 12),
            Text(
              'Bank sync complete — ${feed.transactionsAdded} new transactions added',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Error View ────────────────────────────────────────────────────────────────
class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.danger, size: 48),
          const SizedBox(height: 16),
          Text(message, style: AppTextStyles.bodyMedium, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
