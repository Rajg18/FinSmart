import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../data/models/budget_models.dart';
import '../../providers/budget_provider.dart';

const _categories = [
  'FOOD', 'TRANSPORT', 'GROCERIES', 'ENTERTAINMENT',
  'SUBSCRIPTION', 'HEALTHCARE', 'EDUCATION', 'SHOPPING',
  'UTILITIES', 'SAVINGS', 'OTHERS',
];

class BudgetsScreen extends ConsumerWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(budgetListProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Budgets', style: AppTextStyles.displayMedium),
                    Text('Monthly spending limits by category',
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: () => _showBudgetDialog(context, ref),
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Set Budget'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            listAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (list) => list.isEmpty
                  ? const SizedBox.shrink()
                  : _SummaryStrip(budgets: list),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: listAsync.when(
                loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.accent)),
                error: (e, _) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline_rounded,
                          color: AppColors.danger, size: 40),
                      const SizedBox(height: 12),
                      Text(e.toString(), style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(budgetListProvider),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                data: (list) => list.isEmpty
                    ? _EmptyState(onAdd: () => _showBudgetDialog(context, ref))
                    : _BudgetGrid(
                        budgets: list,
                        onEdit: (b) => _showBudgetDialog(context, ref, existing: b),
                        onDelete: (b) => _confirmDelete(context, ref, b),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBudgetDialog(BuildContext context, WidgetRef ref,
      {BudgetResponse? existing}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => _BudgetDialog(existing: existing, ref: ref),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, BudgetResponse budget) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: AppColors.surfaceCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Remove Budget', style: AppTextStyles.headingMedium),
        content: Text(
          'Remove the ${_catLabel(budget.category)} budget of ${Formatters.currency(budget.limitAmount)}?',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(dialogCtx);
              final error =
                  await ref.read(budgetNotifierProvider.notifier).delete(budget.id);
              if (error != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Delete failed: $error'),
                  backgroundColor: AppColors.danger,
                ));
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}

// ── Summary strip ─────────────────────────────────────────────────────────────
class _SummaryStrip extends StatelessWidget {
  final List<BudgetResponse> budgets;
  const _SummaryStrip({required this.budgets});

  @override
  Widget build(BuildContext context) {
    final totalLimit = budgets.fold(0.0, (s, b) => s + b.limitAmount);
    final totalSpent = budgets.fold(0.0, (s, b) => s + b.spentAmount);
    final overCount = budgets.where((b) => b.percentageUsed >= 100).length;
    final warnCount =
        budgets.where((b) => b.percentageUsed >= 80 && b.percentageUsed < 100).length;

    return Row(
      children: [
        _StripTile(
          label: 'Total Budgeted',
          value: Formatters.currency(totalLimit),
          color: AppColors.accent,
          icon: Icons.account_balance_wallet_rounded,
        ),
        const SizedBox(width: 12),
        _StripTile(
          label: 'Total Spent',
          value: Formatters.currency(totalSpent),
          color: totalSpent > totalLimit ? AppColors.danger : AppColors.textSecondary,
          icon: Icons.payments_rounded,
        ),
        const SizedBox(width: 12),
        _StripTile(
          label: 'Remaining',
          value: Formatters.currency(totalLimit - totalSpent),
          color: (totalLimit - totalSpent) >= 0 ? AppColors.success : AppColors.danger,
          icon: Icons.savings_rounded,
        ),
        if (overCount > 0) ...[
          const SizedBox(width: 12),
          _StripTile(
            label: 'Over Limit',
            value: '$overCount categor${overCount == 1 ? 'y' : 'ies'}',
            color: AppColors.danger,
            icon: Icons.warning_amber_rounded,
          ),
        ],
        if (warnCount > 0) ...[
          const SizedBox(width: 12),
          _StripTile(
            label: 'Near Limit',
            value: '$warnCount categor${warnCount == 1 ? 'y' : 'ies'}',
            color: AppColors.warning,
            icon: Icons.info_outline_rounded,
          ),
        ],
        const Spacer(),
        Text('${budgets.length} active budgets', style: AppTextStyles.caption),
      ],
    );
  }
}

class _StripTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  const _StripTile(
      {required this.label, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              Text(value,
                  style: AppTextStyles.labelMedium
                      .copyWith(color: color, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Budget grid ───────────────────────────────────────────────────────────────
class _BudgetGrid extends StatelessWidget {
  final List<BudgetResponse> budgets;
  final void Function(BudgetResponse) onEdit;
  final void Function(BudgetResponse) onDelete;
  const _BudgetGrid(
      {required this.budgets, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 340,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 1.55,
      ),
      itemCount: budgets.length,
      itemBuilder: (_, i) => _BudgetCard(
        budget: budgets[i],
        onEdit: () => onEdit(budgets[i]),
        onDelete: () => onDelete(budgets[i]),
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  final BudgetResponse budget;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const _BudgetCard(
      {required this.budget, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final pct = budget.percentageUsed.clamp(0.0, 100.0);
    final Color barColor =
        pct >= 100 ? AppColors.danger : pct >= 80 ? AppColors.warning : AppColors.success;
    final catColor = _catColor(budget.category);

    return AppCard(
      padding: const EdgeInsets.all(18),
      onTap: onEdit,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: catColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_catIcon(budget.category), color: catColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(_catLabel(budget.category),
                    style: AppTextStyles.labelLarge, overflow: TextOverflow.ellipsis),
              ),
              if (budget.alert100Sent)
                _AlertDot(color: AppColors.danger, tooltip: 'Over limit alert sent')
              else if (budget.alert80Sent)
                _AlertDot(color: AppColors.warning, tooltip: '80% alert sent')
              else if (budget.alert50Sent)
                _AlertDot(color: AppColors.accentLight, tooltip: '50% alert sent'),
              const SizedBox(width: 4),
              _IconBtn(icon: Icons.edit_outlined, color: AppColors.textSecondary, onTap: onEdit),
              _IconBtn(
                  icon: Icons.delete_outline_rounded, color: AppColors.danger, onTap: onDelete),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Spent', style: AppTextStyles.caption),
                  Text(Formatters.currency(budget.spentAmount),
                      style: AppTextStyles.moneySmall.copyWith(color: barColor, fontSize: 13)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Limit', style: AppTextStyles.caption),
                  Text(Formatters.currency(budget.limitAmount),
                      style: AppTextStyles.moneySmall.copyWith(fontSize: 13)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct / 100,
              minHeight: 6,
              backgroundColor: AppColors.surfaceBorder,
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${pct.toStringAsFixed(1)}% used',
                  style: AppTextStyles.caption.copyWith(color: barColor)),
              Text(
                budget.remainingAmount >= 0
                    ? '${Formatters.currency(budget.remainingAmount)} left'
                    : '${Formatters.currency(budget.remainingAmount.abs())} over',
                style: AppTextStyles.caption.copyWith(
                    color: budget.remainingAmount >= 0
                        ? AppColors.textSecondary
                        : AppColors.danger),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AlertDot extends StatelessWidget {
  final Color color;
  final String tooltip;
  const _AlertDot({required this.color, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _IconBtn({required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.pie_chart_outline_rounded,
              size: 56, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text('No budgets set yet',
              style: AppTextStyles.headingMedium
                  .copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 8),
          Text('Set spending limits to keep your categories on track',
              style: AppTextStyles.bodyMedium),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded, size: 16),
            label: const Text('Set your first budget'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Add / Edit dialog ─────────────────────────────────────────────────────────
class _BudgetDialog extends ConsumerStatefulWidget {
  final BudgetResponse? existing;
  final WidgetRef ref;
  const _BudgetDialog({this.existing, required this.ref});

  @override
  ConsumerState<_BudgetDialog> createState() => _BudgetDialogState();
}

class _BudgetDialogState extends ConsumerState<_BudgetDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  String _category = 'FOOD';

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      _category = widget.existing!.category;
      _amountCtrl.text = widget.existing!.limitAmount.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final req = BudgetRequest(
      category: _category,
      limitAmount: double.parse(_amountCtrl.text),
    );
    Navigator.pop(context);
    String? error;
    if (widget.existing == null) {
      error = await ref.read(budgetNotifierProvider.notifier).create(req);
    } else {
      error = await ref
          .read(budgetNotifierProvider.notifier)
          .update(widget.existing!.id, req);
    }
    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed: $error'),
        backgroundColor: AppColors.danger,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;
    return Dialog(
      backgroundColor: AppColors.surfaceCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(isEdit ? 'Edit Budget' : 'Set Budget',
                        style: AppTextStyles.headingLarge),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded,
                          color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Limits reset automatically on the 1st of each month.',
                  style: AppTextStyles.caption,
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: _category,
                  dropdownColor: AppColors.surfaceElevated,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    labelText: 'Category',
                    prefixIcon: const Icon(Icons.category_rounded),
                    enabled: !isEdit,
                  ),
                  items: _categories
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Row(
                              children: [
                                Icon(_catIcon(c), size: 16, color: _catColor(c)),
                                const SizedBox(width: 8),
                                Text(_catLabel(c)),
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: isEdit ? null : (v) => setState(() => _category = v!),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _amountCtrl,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    labelText: 'Monthly Limit (₹)',
                    prefixIcon: Icon(Icons.currency_rupee_rounded),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Required';
                    final n = double.tryParse(v);
                    if (n == null || n < 1) return 'Must be at least ₹1';
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: Text(isEdit ? 'Save Changes' : 'Set Budget'),
                ),
              ],
            ),
          ),
        ),
      ),
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
      _ => AppColors.catOther,
    };

IconData _catIcon(String cat) => switch (cat) {
      'FOOD' => Icons.restaurant_rounded,
      'TRANSPORT' => Icons.directions_car_rounded,
      'GROCERIES' => Icons.shopping_cart_rounded,
      'SHOPPING' => Icons.shopping_bag_rounded,
      'HEALTHCARE' => Icons.favorite_rounded,
      'ENTERTAINMENT' => Icons.movie_rounded,
      'SUBSCRIPTION' => Icons.repeat_rounded,
      'UTILITIES' => Icons.bolt_rounded,
      'EDUCATION' => Icons.school_rounded,
      'SAVINGS' => Icons.savings_rounded,
      _ => Icons.receipt_rounded,
    };
