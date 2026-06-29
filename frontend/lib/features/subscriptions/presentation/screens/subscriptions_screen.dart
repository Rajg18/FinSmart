import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../data/models/subscription_models.dart';
import '../../providers/subscription_provider.dart';

class SubscriptionsScreen extends ConsumerWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(subscriptionSummaryProvider);
    final listAsync = ref.watch(subscriptionListProvider);
    final showInactive = ref.watch(showInactiveProvider);

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
                    Text('Subscriptions', style: AppTextStyles.displayMedium),
                    Text('Recurring services & monthly burden',
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
                const Spacer(),
                // Toggle inactive
                TextButton.icon(
                  onPressed: () =>
                      ref.read(showInactiveProvider.notifier).toggle(),
                  icon: Icon(
                    showInactive
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 16,
                  ),
                  label: Text(showInactive ? 'Active only' : 'Show all'),
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: () => _showSubDialog(context, ref),
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Add Subscription'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Summary banner
            summaryAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (s) => s.activeCount == 0
                  ? const SizedBox.shrink()
                  : _SummaryBanner(summary: s),
            ),
            const SizedBox(height: 20),

            // List
            Expanded(
              child: listAsync.when(
                loading: () => const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.accent)),
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
                        onPressed: () =>
                            ref.invalidate(subscriptionListProvider),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                data: (list) => list.isEmpty
                    ? _EmptyState(
                        showInactive: showInactive,
                        onAdd: () => _showSubDialog(context, ref),
                        onShowAll: () =>
                            ref.read(showInactiveProvider.notifier).toggle(),
                      )
                    : _SubList(
                        subs: list,
                        onEdit: (s) => _showSubDialog(context, ref, existing: s),
                        onToggle: (s) => _doToggle(context, ref, s),
                        onDelete: (s) => _confirmDelete(context, ref, s),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSubDialog(BuildContext context, WidgetRef ref,
      {SubscriptionResponse? existing}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => _SubDialog(existing: existing, ref: ref),
    );
  }

  Future<void> _doToggle(
      BuildContext context, WidgetRef ref, SubscriptionResponse sub) async {
    final error =
        await ref.read(subscriptionNotifierProvider.notifier).toggle(sub.id);
    if (error != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Toggle failed: $error'),
        backgroundColor: AppColors.danger,
      ));
    }
  }

  void _confirmDelete(
      BuildContext context, WidgetRef ref, SubscriptionResponse sub) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: AppColors.surfaceCard,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Delete Subscription', style: AppTextStyles.headingMedium),
        content: Text(
          'Delete "${sub.name}"? This cannot be undone.',
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
                  .read(subscriptionNotifierProvider.notifier)
                  .delete(sub.id);
              if (error != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Delete failed: $error'),
                  backgroundColor: AppColors.danger,
                ));
              }
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

// ── Summary banner ────────────────────────────────────────────────────────────
class _SummaryBanner extends StatelessWidget {
  final SubscriptionSummaryResponse summary;
  const _SummaryBanner({required this.summary});

  @override
  Widget build(BuildContext context) {
    final monthly = summary.totalMonthlyBurden;
    final yearly = monthly * 12;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withValues(alpha: 0.15),
            AppColors.accentLight.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.repeat_rounded, color: AppColors.accent, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${summary.activeCount} active subscriptions',
                  style: AppTextStyles.labelLarge),
              const SizedBox(height: 2),
              Text('Renews automatically — don\'t forget to review',
                  style: AppTextStyles.caption),
            ],
          ),
          const Spacer(),
          _BurdenTile(
              label: 'Monthly burden', value: Formatters.currency(monthly)),
          const SizedBox(width: 28),
          _BurdenTile(
              label: 'Annual cost',
              value: Formatters.currency(yearly),
              dimmed: true),
        ],
      ),
    );
  }
}

class _BurdenTile extends StatelessWidget {
  final String label;
  final String value;
  final bool dimmed;
  const _BurdenTile(
      {required this.label, required this.value, this.dimmed = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: AppTextStyles.caption),
        Text(value,
            style: AppTextStyles.moneyMedium.copyWith(
              color: dimmed ? AppColors.textSecondary : AppColors.textPrimary,
              fontSize: 18,
            )),
      ],
    );
  }
}

// ── Subscription list ─────────────────────────────────────────────────────────
class _SubList extends StatelessWidget {
  final List<SubscriptionResponse> subs;
  final void Function(SubscriptionResponse) onEdit;
  final void Function(SubscriptionResponse) onToggle;
  final void Function(SubscriptionResponse) onDelete;

  const _SubList({
    required this.subs,
    required this.onEdit,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Group by billing cycle
    final monthly = subs.where((s) => s.billingCycle == 'MONTHLY').toList();
    final quarterly =
        subs.where((s) => s.billingCycle == 'QUARTERLY').toList();
    final yearly = subs.where((s) => s.billingCycle == 'YEARLY').toList();

    return ListView(
      children: [
        if (monthly.isNotEmpty) ...[
          _GroupHeader(
              label: 'Monthly',
              count: monthly.length,
              total: monthly.fold(
                  0.0, (s, sub) => s + sub.monthlyEquivalent)),
          const SizedBox(height: 8),
          ...monthly.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _SubCard(
                    sub: s,
                    onEdit: () => onEdit(s),
                    onToggle: () => onToggle(s),
                    onDelete: () => onDelete(s)),
              )),
          const SizedBox(height: 8),
        ],
        if (quarterly.isNotEmpty) ...[
          _GroupHeader(
              label: 'Quarterly',
              count: quarterly.length,
              total: quarterly.fold(
                  0.0, (s, sub) => s + sub.monthlyEquivalent)),
          const SizedBox(height: 8),
          ...quarterly.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _SubCard(
                    sub: s,
                    onEdit: () => onEdit(s),
                    onToggle: () => onToggle(s),
                    onDelete: () => onDelete(s)),
              )),
          const SizedBox(height: 8),
        ],
        if (yearly.isNotEmpty) ...[
          _GroupHeader(
              label: 'Yearly',
              count: yearly.length,
              total:
                  yearly.fold(0.0, (s, sub) => s + sub.monthlyEquivalent)),
          const SizedBox(height: 8),
          ...yearly.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _SubCard(
                    sub: s,
                    onEdit: () => onEdit(s),
                    onToggle: () => onToggle(s),
                    onDelete: () => onDelete(s)),
              )),
        ],
      ],
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final String label;
  final int count;
  final double total;
  const _GroupHeader(
      {required this.label, required this.count, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,
            style: AppTextStyles.labelLarge
                .copyWith(color: AppColors.textSecondary)),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.surfaceBorder,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('$count',
              style: AppTextStyles.caption
                  .copyWith(color: AppColors.textSecondary)),
        ),
        const Spacer(),
        Text('${Formatters.currency(total)}/mo equiv.',
            style: AppTextStyles.caption),
      ],
    );
  }
}

class _SubCard extends StatelessWidget {
  final SubscriptionResponse sub;
  final VoidCallback onEdit;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const _SubCard({
    required this.sub,
    required this.onEdit,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final renewalDays = _daysToRenewal();
    final isUrgent = renewalDays != null && renewalDays <= 7 && sub.active;

    return Opacity(
      opacity: sub.active ? 1.0 : 0.55,
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        onTap: onEdit,
        child: Row(
          children: [
            // Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: sub.active
                    ? AppColors.accent.withValues(alpha: 0.12)
                    : AppColors.surfaceBorder,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.repeat_rounded,
                color: sub.active ? AppColors.accent : AppColors.textMuted,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),

            // Name + renewal
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(sub.name,
                          style: AppTextStyles.labelLarge,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(width: 8),
                      if (!sub.active)
                        _Badge(
                            label: 'Inactive',
                            color: AppColors.textMuted),
                      if (isUrgent)
                        _Badge(
                            label: 'Renews in ${renewalDays}d',
                            color: AppColors.warning),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _CycleBadge(cycle: sub.billingCycle),
                      const SizedBox(width: 8),
                      if (sub.renewalDate != null)
                        Text(
                          'Renews ${_formatDate(sub.renewalDate!)}',
                          style: AppTextStyles.caption,
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Amounts
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Formatters.currency(sub.amount),
                  style: AppTextStyles.moneySmall.copyWith(fontSize: 15),
                ),
                Text(
                  '${Formatters.currency(sub.monthlyEquivalent)}/mo',
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // Actions
            Row(
              children: [
                // Toggle active
                Tooltip(
                  message: sub.active ? 'Pause' : 'Activate',
                  child: InkWell(
                    onTap: onToggle,
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        sub.active
                            ? Icons.pause_circle_outline_rounded
                            : Icons.play_circle_outline_rounded,
                        size: 18,
                        color: sub.active
                            ? AppColors.warning
                            : AppColors.success,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: onEdit,
                  borderRadius: BorderRadius.circular(6),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.edit_outlined,
                        size: 16, color: AppColors.textSecondary),
                  ),
                ),
                InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(6),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.delete_outline_rounded,
                        size: 16, color: AppColors.danger),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int? _daysToRenewal() {
    if (sub.renewalDate == null) return null;
    try {
      final renewal = DateTime.parse(sub.renewalDate!);
      return renewal.difference(DateTime.now()).inDays;
    } catch (_) {
      return null;
    }
  }

  String _formatDate(String d) {
    try {
      return Formatters.dateMedium(DateTime.parse(d));
    } catch (_) {
      return d;
    }
  }
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
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          style: AppTextStyles.caption.copyWith(color: color, fontSize: 10)),
    );
  }
}

class _CycleBadge extends StatelessWidget {
  final String cycle;
  const _CycleBadge({required this.cycle});

  @override
  Widget build(BuildContext context) {
    final (String label, Color color) = switch (cycle) {
      'MONTHLY' => ('Monthly', AppColors.accentLight),
      'QUARTERLY' => ('Quarterly', AppColors.warning),
      'YEARLY' => ('Yearly', AppColors.catHealth),
      _ => (cycle, AppColors.textMuted),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label,
          style: AppTextStyles.caption.copyWith(color: color, fontSize: 10)),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final bool showInactive;
  final VoidCallback onAdd;
  final VoidCallback onShowAll;
  const _EmptyState(
      {required this.showInactive,
      required this.onAdd,
      required this.onShowAll});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.repeat_rounded,
              size: 56, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text(
            showInactive
                ? 'No subscriptions at all'
                : 'No active subscriptions',
            style: AppTextStyles.headingMedium
                .copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            showInactive
                ? 'Add your first recurring service'
                : 'All subscriptions are inactive — toggle to show them',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add_rounded, size: 16),
                label: const Text('Add subscription'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                ),
              ),
              if (!showInactive) ...[
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: onShowAll,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.surfaceBorder),
                    foregroundColor: AppColors.textSecondary,
                  ),
                  child: const Text('Show all'),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ── Add / Edit dialog ─────────────────────────────────────────────────────────
class _SubDialog extends ConsumerStatefulWidget {
  final SubscriptionResponse? existing;
  final WidgetRef ref;
  const _SubDialog({this.existing, required this.ref});

  @override
  ConsumerState<_SubDialog> createState() => _SubDialogState();
}

class _SubDialogState extends ConsumerState<_SubDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  String _cycle = 'MONTHLY';
  DateTime _startDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      final e = widget.existing!;
      _nameCtrl.text = e.name;
      _amountCtrl.text = e.amount.toStringAsFixed(0);
      _cycle = e.billingCycle;
      try {
        _startDate = DateTime.parse(e.startDate);
      } catch (_) {}
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final req = SubscriptionRequest(
      name: _nameCtrl.text.trim(),
      amount: double.parse(_amountCtrl.text),
      billingCycle: _cycle,
      startDate: _startDate.toIso8601String().split('T').first,
    );
    Navigator.pop(context);
    String? error;
    if (widget.existing == null) {
      error =
          await ref.read(subscriptionNotifierProvider.notifier).create(req);
    } else {
      error = await ref
          .read(subscriptionNotifierProvider.notifier)
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
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
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
                    Text(
                        isEdit
                            ? 'Edit Subscription'
                            : 'Add Subscription',
                        style: AppTextStyles.headingLarge),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded,
                          color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Name
                TextFormField(
                  controller: _nameCtrl,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    labelText: 'Service Name',
                    prefixIcon: Icon(Icons.subscriptions_rounded),
                    hintText: 'Netflix, Spotify, iCloud...',
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Name is required' : null,
                ),
                const SizedBox(height: 14),

                // Amount + Cycle row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _amountCtrl,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                                decimal: true),
                        style: const TextStyle(
                            color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          labelText: 'Amount (₹)',
                          prefixIcon:
                              Icon(Icons.currency_rupee_rounded),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Required';
                          final n = double.tryParse(v);
                          if (n == null || n < 1) return 'Min ₹1';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _cycle,
                        dropdownColor: AppColors.surfaceElevated,
                        style: const TextStyle(
                            color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          labelText: 'Billing Cycle',
                          prefixIcon: Icon(Icons.repeat_rounded),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: 'MONTHLY', child: Text('Monthly')),
                          DropdownMenuItem(
                              value: 'QUARTERLY',
                              child: Text('Quarterly')),
                          DropdownMenuItem(
                              value: 'YEARLY', child: Text('Yearly')),
                        ],
                        onChanged: (v) => setState(() => _cycle = v!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Start date
                _DatePicker(
                  label: 'Start Date',
                  value: _startDate,
                  firstDate: DateTime(2015),
                  lastDate: DateTime(2040),
                  onPicked: (d) => setState(() => _startDate = d),
                ),

                // Monthly equivalent hint
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.15)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          size: 14, color: AppColors.accent),
                      const SizedBox(width: 8),
                      Text(
                        _monthlyEquivHint(),
                        style: AppTextStyles.caption
                            .copyWith(color: AppColors.accent),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 14)),
                  child: Text(
                      isEdit ? 'Save Changes' : 'Add Subscription'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _monthlyEquivHint() {
    final amount = double.tryParse(_amountCtrl.text) ?? 0;
    if (amount <= 0) return 'Monthly equivalent will be calculated automatically';
    final equiv = switch (_cycle) {
      'QUARTERLY' => amount / 3,
      'YEARLY' => amount / 12,
      _ => amount,
    };
    return 'Monthly equivalent: ${Formatters.currency(equiv)}/mo';
  }
}

class _DatePicker extends StatelessWidget {
  final String label;
  final DateTime? value;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime) onPicked;
  final VoidCallback? onClear;

  const _DatePicker({
    required this.label,
    required this.value,
    required this.firstDate,
    required this.lastDate,
    required this.onPicked,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
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
        if (picked != null) onPicked(picked);
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.surfaceBorder),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today_rounded,
                size: 18, color: AppColors.textSecondary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value == null
                    ? label
                    : '$label: ${DateFormat('dd MMM yyyy').format(value!)}',
                style: value == null
                    ? AppTextStyles.bodyMedium
                    : AppTextStyles.bodyLarge,
              ),
            ),
            if (value != null && onClear != null)
              GestureDetector(
                onTap: onClear,
                child: const Icon(Icons.clear_rounded,
                    size: 16, color: AppColors.textMuted),
              ),
          ],
        ),
      ),
    );
  }
}
