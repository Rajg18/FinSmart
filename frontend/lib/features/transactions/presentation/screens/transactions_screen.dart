import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';

import '../../data/models/transaction_models.dart';
import '../../providers/transaction_provider.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageAsync = ref.watch(transactionPageProvider);
    final filter = ref.watch(transactionFilterProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transactions', style: AppTextStyles.displayMedium),
                      Text('All your income & expenses', style: AppTextStyles.bodyMedium),
                    ],
                  ),
                  const Spacer(),
                  FilledButton.icon(
                    onPressed: () => _showTransactionDialog(context, ref),
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Add Transaction'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Filter bar
              _FilterBar(filter: filter, ref: ref),
              const SizedBox(height: 20),

              // Transaction list
              Expanded(
                child: pageAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator(color: AppColors.accent)),
                  error: (e, _) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline_rounded, color: AppColors.danger, size: 40),
                        const SizedBox(height: 12),
                        Text(e.toString(), style: AppTextStyles.bodyMedium),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => ref.invalidate(transactionPageProvider),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  data: (page) => page.content.isEmpty
                      ? _EmptyState(hasFilter: filter.type != null || filter.category != null)
                      : Column(
                          children: [
                            // Summary bar
                            _SummaryBar(items: page.content),
                            const SizedBox(height: 16),
                            // List
                            Expanded(
                              child: ListView.separated(
                                itemCount: page.content.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 8),
                                itemBuilder: (_, i) => _TransactionCard(
                                  item: page.content[i],
                                  onEdit: () => _showTransactionDialog(
                                      context, ref, existing: page.content[i]),
                                  onDelete: () => _confirmDelete(
                                      context, ref, page.content[i]),
                                ),
                              ),
                            ),
                            // Pagination
                            if (!page.last || page.number > 0)
                              _Pagination(page: page, ref: ref),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  void _showTransactionDialog(BuildContext context, WidgetRef ref,
      {TransactionItem? existing}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => _TransactionDialog(existing: existing, ref: ref),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, TransactionItem item) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: AppColors.surfaceCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Delete Transaction', style: AppTextStyles.headingMedium),
        content: Text(
          'Delete "${item.merchant}" for ${Formatters.currency(item.amount)}? This cannot be undone.',
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
              final error = await ref
                  .read(transactionNotifierProvider.notifier)
                  .delete(item.id);
              if (error != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Delete failed: $error'),
                    backgroundColor: AppColors.danger,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

// ── Filter Bar ────────────────────────────────────────────────────────────────
class _FilterBar extends StatelessWidget {
  final ({String? type, String? category, int page}) filter;
  final WidgetRef ref;

  const _FilterBar({required this.filter, required this.ref});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Type filters
          _FilterChip(
            label: 'All',
            selected: filter.type == null && filter.category == null,
            onTap: () => ref.read(transactionFilterProvider.notifier).reset(),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Income',
            selected: filter.type == 'CREDIT',
            color: AppColors.success,
            onTap: () => ref.read(transactionFilterProvider.notifier).setType('CREDIT'),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Expense',
            selected: filter.type == 'DEBIT',
            color: AppColors.danger,
            onTap: () => ref.read(transactionFilterProvider.notifier).setType('DEBIT'),
          ),
          const SizedBox(width: 16),
          Container(width: 1, height: 20, color: AppColors.surfaceBorder),
          const SizedBox(width: 16),
          // Category filters
          ...['FOOD', 'TRANSPORT', 'SHOPPING', 'ENTERTAINMENT', 'HEALTHCARE', 'UTILITIES'].map(
            (cat) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _FilterChip(
                label: _catLabel(cat),
                selected: filter.category == cat,
                onTap: () => ref
                    .read(transactionFilterProvider.notifier)
                    .setCategory(filter.category == cat ? null : cat),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _catLabel(String cat) => cat[0] + cat.substring(1).toLowerCase();
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color? color;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.accent;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? c.withValues(alpha: 0.15) : AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? c.withValues(alpha: 0.5) : AppColors.surfaceBorder,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: selected ? c : AppColors.textSecondary,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ── Summary Bar ───────────────────────────────────────────────────────────────
class _SummaryBar extends StatelessWidget {
  final List<TransactionItem> items;
  const _SummaryBar({required this.items});

  @override
  Widget build(BuildContext context) {
    final income = items
        .where((t) => t.type == 'CREDIT')
        .fold(0.0, (s, t) => s + t.amount);
    final expense = items
        .where((t) => t.type == 'DEBIT')
        .fold(0.0, (s, t) => s + t.amount);

    return Row(
      children: [
        _SummaryPill(
          label: 'Income (page)',
          value: Formatters.currency(income),
          color: AppColors.success,
          icon: Icons.arrow_downward_rounded,
        ),
        const SizedBox(width: 12),
        _SummaryPill(
          label: 'Expense (page)',
          value: Formatters.currency(expense),
          color: AppColors.danger,
          icon: Icons.arrow_upward_rounded,
        ),
        const SizedBox(width: 12),
        _SummaryPill(
          label: 'Net',
          value: Formatters.currency(income - expense),
          color: (income - expense) >= 0 ? AppColors.success : AppColors.danger,
          icon: Icons.balance_rounded,
        ),
        const Spacer(),
        Text('${items.length} transactions shown', style: AppTextStyles.caption),
      ],
    );
  }
}

class _SummaryPill extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  const _SummaryPill({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              Text(value,
                  style: AppTextStyles.moneySmall.copyWith(color: color, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Transaction Card ──────────────────────────────────────────────────────────
class _TransactionCard extends StatelessWidget {
  final TransactionItem item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _TransactionCard({
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isCredit = item.type == 'CREDIT';
    final amountColor = isCredit ? AppColors.success : AppColors.danger;
    final catColor = _catColor(item.category);

    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      onTap: onEdit,
      child: Row(
        children: [
          // Category icon
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: catColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_catIcon(item.category), color: catColor, size: 20),
          ),
          const SizedBox(width: 14),
          // Merchant + meta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.merchant,
                    style: AppTextStyles.labelLarge,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 3),
                Row(
                  children: [
                    _Badge(
                      label: _catLabel(item.category),
                      color: catColor,
                    ),
                    const SizedBox(width: 6),
                    if (item.source == 'BANK_FEED')
                      _Badge(label: 'Bank Feed', color: AppColors.accentLight),
                    if (item.paymentMethod != null && item.paymentMethod!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: _Badge(label: item.paymentMethod!, color: AppColors.textMuted),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Amount + date + actions
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isCredit ? '+' : '-'}${Formatters.currency(item.amount)}',
                style: AppTextStyles.moneySmall.copyWith(color: amountColor),
              ),
              const SizedBox(height: 3),
              Text(_formatDate(item.transactionDate), style: AppTextStyles.caption),
              const SizedBox(height: 6),
              Row(
                children: [
                  _IconBtn(icon: Icons.edit_outlined, color: AppColors.textSecondary, onTap: onEdit),
                  const SizedBox(width: 4),
                  _IconBtn(icon: Icons.delete_outline_rounded, color: AppColors.danger, onTap: onDelete),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(String dt) {
    try { return Formatters.dateShort(DateTime.parse(dt)); } catch (_) { return dt; }
  }

  String _catLabel(String cat) {
    return cat[0] + cat.substring(1).toLowerCase().replaceAll('_', ' ');
  }

  Color _catColor(String cat) => switch (cat) {
    'FOOD' => AppColors.catFood,
    'TRANSPORT' => AppColors.catTransport,
    'SHOPPING' => AppColors.catShopping,
    'HEALTHCARE' => AppColors.catHealth,
    'ENTERTAINMENT' => AppColors.catEntertainment,
    'INCOME' => AppColors.catSalary,
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
    'INCOME' => Icons.account_balance_rounded,
    _ => Icons.receipt_rounded,
  };
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(label,
          style: AppTextStyles.caption.copyWith(color: color, fontSize: 10)),
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

// ── Pagination ────────────────────────────────────────────────────────────────
class _Pagination extends StatelessWidget {
  final TransactionPage page;
  final WidgetRef ref;
  const _Pagination({required this.page, required this.ref});

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(transactionFilterProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: filter.page > 0
                ? () => ref
                    .read(transactionFilterProvider.notifier)
                    .prevPage()
                : null,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.surfaceBorder),
              foregroundColor: AppColors.textSecondary,
            ),
            child: const Text('Previous'),
          ),
          const SizedBox(width: 16),
          Text('Page ${page.number + 1} of ${page.totalPages}',
              style: AppTextStyles.bodyMedium),
          const SizedBox(width: 16),
          OutlinedButton(
            onPressed: !page.last
                ? () => ref.read(transactionFilterProvider.notifier).nextPage()
                : null,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.surfaceBorder),
              foregroundColor: AppColors.textSecondary,
            ),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ── Empty State ───────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final bool hasFilter;
  const _EmptyState({required this.hasFilter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            hasFilter ? Icons.filter_list_off_rounded : Icons.receipt_long_rounded,
            size: 56,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: 16),
          Text(
            hasFilter ? 'No transactions match this filter' : 'No transactions yet',
            style: AppTextStyles.headingMedium.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            hasFilter
                ? 'Try clearing the filter'
                : 'Add your first transaction or sync the bank feed',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ── Add / Edit Dialog ─────────────────────────────────────────────────────────
class _TransactionDialog extends ConsumerStatefulWidget {
  final TransactionItem? existing;
  final WidgetRef ref;
  const _TransactionDialog({this.existing, required this.ref});

  @override
  ConsumerState<_TransactionDialog> createState() => _TransactionDialogState();
}

class _TransactionDialogState extends ConsumerState<_TransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _merchantCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _paymentCtrl = TextEditingController();
  String _type = 'DEBIT';
  String _category = 'FOOD';
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      final e = widget.existing!;
      _merchantCtrl.text = e.merchant;
      _amountCtrl.text = e.amount.toString();
      _paymentCtrl.text = e.paymentMethod ?? '';
      _type = e.type;
      _category = e.category;
      try { _date = DateTime.parse(e.transactionDate); } catch (_) {}
    }
  }

  @override
  void dispose() {
    _merchantCtrl.dispose();
    _amountCtrl.dispose();
    _paymentCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final req = TransactionRequest(
      merchant: _merchantCtrl.text.trim(),
      amount: double.parse(_amountCtrl.text),
      type: _type,
      category: _category,
      paymentMethod: _paymentCtrl.text.trim().isEmpty ? null : _paymentCtrl.text.trim(),
      transactionDate: _date.toIso8601String(),
    );
    Navigator.pop(context);
    String? error;
    if (widget.existing == null) {
      error = await ref.read(transactionNotifierProvider.notifier).create(req);
    } else {
      error = await ref
          .read(transactionNotifierProvider.notifier)
          .update(widget.existing!.id, req);
    }
    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: $error'),
          backgroundColor: AppColors.danger,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;
    return Dialog(
      backgroundColor: AppColors.surfaceCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Row(
                  children: [
                    Text(isEdit ? 'Edit Transaction' : 'Add Transaction',
                        style: AppTextStyles.headingLarge),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Type toggle
                Row(
                  children: ['DEBIT', 'CREDIT', 'GOAL_ALLOCATION'].map((t) {
                    final selected = _type == t;
                    final color = t == 'CREDIT'
                        ? AppColors.success
                        : t == 'DEBIT'
                            ? AppColors.danger
                            : AppColors.accent;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => setState(() => _type = t),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: selected
                                  ? color.withValues(alpha: 0.15)
                                  : AppColors.surfaceElevated,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: selected
                                    ? color.withValues(alpha: 0.5)
                                    : AppColors.surfaceBorder,
                              ),
                            ),
                            child: Text(
                              t == 'GOAL_ALLOCATION' ? 'Goal' : t[0] + t.substring(1).toLowerCase(),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.labelMedium.copyWith(
                                color: selected ? color : AppColors.textSecondary,
                                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Merchant
                TextFormField(
                  controller: _merchantCtrl,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    labelText: 'Merchant / Description',
                    prefixIcon: Icon(Icons.store_rounded),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Merchant is required' : null,
                ),
                const SizedBox(height: 14),

                // Amount + Date row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _amountCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          labelText: 'Amount (₹)',
                          prefixIcon: Icon(Icons.currency_rupee_rounded),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Required';
                          if (double.tryParse(v) == null || double.parse(v) <= 0) {
                            return 'Invalid amount';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _date,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                            builder: (ctx, child) => Theme(
                              data: Theme.of(ctx).copyWith(
                                colorScheme: const ColorScheme.dark(
                                  primary: AppColors.accent,
                                  surface: AppColors.surfaceCard,
                                ),
                              ),
                              child: child!,
                            ),
                          );
                          if (picked != null) setState(() => _date = picked);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceCard,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.surfaceBorder),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded,
                                  size: 18, color: AppColors.textSecondary),
                              const SizedBox(width: 8),
                              Text(
                                DateFormat('dd MMM yyyy').format(_date),
                                style: AppTextStyles.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Category dropdown
                DropdownButtonFormField<String>(
                  value: _category,
                  dropdownColor: AppColors.surfaceElevated,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    prefixIcon: Icon(Icons.category_rounded),
                  ),
                  items: [
                    'FOOD', 'TRANSPORT', 'GROCERIES', 'ENTERTAINMENT',
                    'SUBSCRIPTION', 'HEALTHCARE', 'EDUCATION', 'SHOPPING',
                    'UTILITIES', 'INCOME', 'SAVINGS', 'OTHERS'
                  ].map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c[0] + c.substring(1).toLowerCase()),
                      )).toList(),
                  onChanged: (v) => setState(() => _category = v!),
                ),
                const SizedBox(height: 14),

                // Payment method
                TextFormField(
                  controller: _paymentCtrl,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    labelText: 'Payment Method (optional)',
                    prefixIcon: Icon(Icons.credit_card_rounded),
                    hintText: 'UPI, Cash, Card...',
                  ),
                ),
                const SizedBox(height: 24),

                // Submit
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: Text(isEdit ? 'Save Changes' : 'Add Transaction'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
