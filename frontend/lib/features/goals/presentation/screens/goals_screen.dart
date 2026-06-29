import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../data/models/goal_models.dart';
import '../../providers/goal_provider.dart';

class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(goalListProvider);

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
                    Text('Goals', style: AppTextStyles.displayMedium),
                    Text('Track your savings milestones',
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: () => _showGoalDialog(context, ref),
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('New Goal'),
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

            // Summary strip
            listAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (list) =>
                  list.isEmpty ? const SizedBox.shrink() : _SummaryStrip(goals: list),
            ),
            const SizedBox(height: 20),

            // Goal list
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
                        onPressed: () => ref.invalidate(goalListProvider),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                data: (list) => list.isEmpty
                    ? _EmptyState(onAdd: () => _showGoalDialog(context, ref))
                    : _GoalList(
                        goals: list,
                        onAllocate: (g) =>
                            _showAllocateDialog(context, ref, g),
                        onEdit: (g) => _showGoalDialog(context, ref, existing: g),
                        onDelete: (g) => _confirmDelete(context, ref, g),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGoalDialog(BuildContext context, WidgetRef ref,
      {GoalResponse? existing}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => _GoalDialog(existing: existing, ref: ref),
    );
  }

  void _showAllocateDialog(
      BuildContext context, WidgetRef ref, GoalResponse goal) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => _AllocateDialog(goal: goal, ref: ref),
    );
  }

  void _confirmDelete(
      BuildContext context, WidgetRef ref, GoalResponse goal) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: AppColors.surfaceCard,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Delete Goal', style: AppTextStyles.headingMedium),
        content: Text(
          'Delete "${goal.name}"? All allocations will be removed.',
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
                  await ref.read(goalNotifierProvider.notifier).delete(goal.id);
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

// ── Summary strip ─────────────────────────────────────────────────────────────
class _SummaryStrip extends StatelessWidget {
  final List<GoalResponse> goals;
  const _SummaryStrip({required this.goals});

  @override
  Widget build(BuildContext context) {
    final totalTarget = goals.fold(0.0, (s, g) => s + g.targetAmount);
    final totalSaved = goals.fold(0.0, (s, g) => s + g.savedAmount);
    final completed = goals.where((g) => g.status == 'COMPLETED').length;
    final inProgress = goals.where((g) => g.status == 'IN_PROGRESS').length;

    return Row(
      children: [
        _Tile(
          label: 'Total Target',
          value: Formatters.currency(totalTarget),
          color: AppColors.accent,
          icon: Icons.flag_rounded,
        ),
        const SizedBox(width: 12),
        _Tile(
          label: 'Total Saved',
          value: Formatters.currency(totalSaved),
          color: AppColors.success,
          icon: Icons.savings_rounded,
        ),
        const SizedBox(width: 12),
        _Tile(
          label: 'Remaining',
          value: Formatters.currency(totalTarget - totalSaved),
          color: AppColors.textSecondary,
          icon: Icons.hourglass_bottom_rounded,
        ),
        if (completed > 0) ...[
          const SizedBox(width: 12),
          _Tile(
            label: 'Completed',
            value: '$completed goal${completed == 1 ? '' : 's'}',
            color: AppColors.success,
            icon: Icons.check_circle_outline_rounded,
          ),
        ],
        const Spacer(),
        Text('$inProgress active · ${goals.length} total',
            style: AppTextStyles.caption),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  const _Tile(
      {required this.label,
      required this.value,
      required this.color,
      required this.icon});

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

// ── Goal list ─────────────────────────────────────────────────────────────────
class _GoalList extends StatelessWidget {
  final List<GoalResponse> goals;
  final void Function(GoalResponse) onAllocate;
  final void Function(GoalResponse) onEdit;
  final void Function(GoalResponse) onDelete;

  const _GoalList({
    required this.goals,
    required this.onAllocate,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: goals.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _GoalCard(
        goal: goals[i],
        onAllocate: () => onAllocate(goals[i]),
        onEdit: () => onEdit(goals[i]),
        onDelete: () => onDelete(goals[i]),
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final GoalResponse goal;
  final VoidCallback onAllocate;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _GoalCard({
    required this.goal,
    required this.onAllocate,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final pct = goal.progressPercent.clamp(0.0, 100.0);
    final isComplete = goal.status == 'COMPLETED';
    final isPaused = goal.status == 'PAUSED';

    final barColor = isComplete
        ? AppColors.success
        : isPaused
            ? AppColors.textMuted
            : pct >= 75
                ? AppColors.accentLight
                : AppColors.accent;

    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Priority badge + icon
              Column(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: isComplete
                          ? LinearGradient(colors: [
                              AppColors.success,
                              AppColors.success.withValues(alpha: 0.6)
                            ])
                          : LinearGradient(colors: [
                              AppColors.accent,
                              AppColors.accentLight
                            ]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      isComplete
                          ? Icons.check_circle_rounded
                          : Icons.flag_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('#${goal.priority}',
                      style: AppTextStyles.caption
                          .copyWith(color: AppColors.textMuted)),
                ],
              ),
              const SizedBox(width: 16),

              // Name + status + deadline
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(goal.name,
                              style: AppTextStyles.headingMedium,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 8),
                        _StatusBadge(status: goal.status),
                      ],
                    ),
                    if (goal.deadline != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_rounded,
                              size: 12, color: AppColors.textMuted),
                          const SizedBox(width: 4),
                          Text(
                            'Due ${_formatDeadline(goal.deadline!)}',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              // Actions
              Row(
                children: [
                  if (!isComplete)
                    _ActionBtn(
                      icon: Icons.add_rounded,
                      label: 'Add Funds',
                      color: AppColors.success,
                      onTap: onAllocate,
                    ),
                  const SizedBox(width: 6),
                  _IconBtn(
                      icon: Icons.edit_outlined,
                      color: AppColors.textSecondary,
                      onTap: onEdit),
                  _IconBtn(
                      icon: Icons.delete_outline_rounded,
                      color: AppColors.danger,
                      onTap: onDelete),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct / 100,
              minHeight: 8,
              backgroundColor: AppColors.surfaceBorder,
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
          const SizedBox(height: 10),

          // Amounts row
          Row(
            children: [
              // Saved
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saved', style: AppTextStyles.caption),
                  Text(Formatters.currency(goal.savedAmount),
                      style: AppTextStyles.moneySmall
                          .copyWith(color: AppColors.success, fontSize: 14)),
                ],
              ),
              const SizedBox(width: 24),
              // Remaining
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Remaining', style: AppTextStyles.caption),
                  Text(Formatters.currency(goal.remainingAmount),
                      style: AppTextStyles.moneySmall.copyWith(fontSize: 14)),
                ],
              ),
              const SizedBox(width: 24),
              // Target
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Target', style: AppTextStyles.caption),
                  Text(Formatters.currency(goal.targetAmount),
                      style: AppTextStyles.moneySmall.copyWith(fontSize: 14)),
                ],
              ),
              const Spacer(),
              // Progress % + required monthly
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${pct.toStringAsFixed(1)}% complete',
                      style: AppTextStyles.labelMedium
                          .copyWith(color: barColor)),
                  if (goal.requiredMonthly != null &&
                      goal.requiredMonthly! > 0 &&
                      !isComplete)
                    Text(
                      '${Formatters.currency(goal.requiredMonthly!)}/mo needed',
                      style: AppTextStyles.caption,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDeadline(String deadline) {
    try {
      return Formatters.dateMedium(DateTime.parse(deadline));
    } catch (_) {
      return deadline;
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (Color color, String label) = switch (status) {
      'COMPLETED' => (AppColors.success, 'Completed'),
      'PAUSED' => (AppColors.textMuted, 'Paused'),
      _ => (AppColors.accent, 'In Progress'),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          style: AppTextStyles.caption.copyWith(color: color, fontSize: 10)),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _ActionBtn(
      {required this.icon,
      required this.label,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(label,
                style: AppTextStyles.caption
                    .copyWith(color: color, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _IconBtn(
      {required this.icon, required this.color, required this.onTap});

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
          const Icon(Icons.flag_outlined, size: 56, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text('No goals yet',
              style: AppTextStyles.headingMedium
                  .copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 8),
          Text('Create a savings goal and start building towards it',
              style: AppTextStyles.bodyMedium),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded, size: 16),
            label: const Text('Create your first goal'),
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

// ── Create / Edit dialog ──────────────────────────────────────────────────────
class _GoalDialog extends ConsumerStatefulWidget {
  final GoalResponse? existing;
  final WidgetRef ref;
  const _GoalDialog({this.existing, required this.ref});

  @override
  ConsumerState<_GoalDialog> createState() => _GoalDialogState();
}

class _GoalDialogState extends ConsumerState<_GoalDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  DateTime? _deadline;
  int _priority = 1;
  String _status = 'IN_PROGRESS';

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      final e = widget.existing!;
      _nameCtrl.text = e.name;
      _amountCtrl.text = e.targetAmount.toStringAsFixed(0);
      _priority = e.priority;
      _status = e.status;
      if (e.deadline != null) {
        try {
          _deadline = DateTime.parse(e.deadline!);
        } catch (_) {}
      }
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
    final req = GoalRequest(
      name: _nameCtrl.text.trim(),
      targetAmount: double.parse(_amountCtrl.text),
      deadline: _deadline?.toIso8601String().split('T').first,
      priority: _priority,
      status: widget.existing != null ? _status : null,
    );
    Navigator.pop(context);
    String? error;
    if (widget.existing == null) {
      error = await ref.read(goalNotifierProvider.notifier).create(req);
    } else {
      error = await ref
          .read(goalNotifierProvider.notifier)
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
                    Text(isEdit ? 'Edit Goal' : 'New Goal',
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
                    labelText: 'Goal Name',
                    prefixIcon: Icon(Icons.flag_rounded),
                    hintText: 'e.g. Emergency Fund, New Laptop',
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Name is required' : null,
                ),
                const SizedBox(height: 14),

                // Target + Priority row
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _amountCtrl,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        style:
                            const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          labelText: 'Target Amount (₹)',
                          prefixIcon: Icon(Icons.currency_rupee_rounded),
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
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Priority',
                              style: AppTextStyles.caption
                                  .copyWith(color: AppColors.textSecondary)),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              _PriorityBtn(
                                  value: 1,
                                  current: _priority,
                                  onTap: () =>
                                      setState(() => _priority = 1)),
                              const SizedBox(width: 6),
                              _PriorityBtn(
                                  value: 2,
                                  current: _priority,
                                  onTap: () =>
                                      setState(() => _priority = 2)),
                              const SizedBox(width: 6),
                              _PriorityBtn(
                                  value: 3,
                                  current: _priority,
                                  onTap: () =>
                                      setState(() => _priority = 3)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Deadline picker
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _deadline ??
                          DateTime.now().add(const Duration(days: 180)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040),
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
                    if (picked != null) setState(() => _deadline = picked);
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
                        const Icon(Icons.event_rounded,
                            size: 20, color: AppColors.textSecondary),
                        const SizedBox(width: 12),
                        Text(
                          _deadline == null
                              ? 'Set deadline (optional)'
                              : 'Deadline: ${DateFormat('dd MMM yyyy').format(_deadline!)}',
                          style: _deadline == null
                              ? AppTextStyles.bodyMedium
                              : AppTextStyles.bodyLarge,
                        ),
                        const Spacer(),
                        if (_deadline != null)
                          GestureDetector(
                            onTap: () => setState(() => _deadline = null),
                            child: const Icon(Icons.clear_rounded,
                                size: 16, color: AppColors.textMuted),
                          ),
                      ],
                    ),
                  ),
                ),

                // Status — only when editing
                if (isEdit) ...[
                  const SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    value: _status,
                    dropdownColor: AppColors.surfaceElevated,
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      prefixIcon: Icon(Icons.tune_rounded),
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: 'IN_PROGRESS', child: Text('In Progress')),
                      DropdownMenuItem(
                          value: 'PAUSED', child: Text('Paused')),
                      DropdownMenuItem(
                          value: 'COMPLETED', child: Text('Completed')),
                    ],
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                ],
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: Text(isEdit ? 'Save Changes' : 'Create Goal'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PriorityBtn extends StatelessWidget {
  final int value;
  final int current;
  final VoidCallback onTap;
  const _PriorityBtn(
      {required this.value, required this.current, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final selected = value == current;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent.withValues(alpha: 0.15)
              : AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? AppColors.accent.withValues(alpha: 0.5)
                : AppColors.surfaceBorder,
          ),
        ),
        child: Center(
          child: Text(
            '#$value',
            style: AppTextStyles.labelMedium.copyWith(
              color: selected ? AppColors.accent : AppColors.textSecondary,
              fontWeight:
                  selected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Allocate dialog ───────────────────────────────────────────────────────────
class _AllocateDialog extends ConsumerStatefulWidget {
  final GoalResponse goal;
  final WidgetRef ref;
  const _AllocateDialog({required this.goal, required this.ref});

  @override
  ConsumerState<_AllocateDialog> createState() => _AllocateDialogState();
}

class _AllocateDialogState extends ConsumerState<_AllocateDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final req = GoalAllocationRequest(
        amount: double.parse(_amountCtrl.text));
    Navigator.pop(context);
    final error = await ref
        .read(goalNotifierProvider.notifier)
        .allocate(widget.goal.id, req);
    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Allocation failed: $error'),
        backgroundColor: AppColors.danger,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final remaining = widget.goal.remainingAmount;
    final pct = widget.goal.progressPercent.clamp(0.0, 100.0);

    return Dialog(
      backgroundColor: AppColors.surfaceCard,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add Funds',
                            style: AppTextStyles.headingLarge),
                        Text(widget.goal.name,
                            style: AppTextStyles.bodyMedium),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded,
                          color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Mini progress
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: pct / 100,
                    minHeight: 8,
                    backgroundColor: AppColors.surfaceBorder,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.accent),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${Formatters.currency(widget.goal.savedAmount)} saved',
                        style: AppTextStyles.caption
                            .copyWith(color: AppColors.success)),
                    Text('${pct.toStringAsFixed(1)}%',
                        style: AppTextStyles.caption
                            .copyWith(color: AppColors.accent)),
                    Text(
                        '${Formatters.currency(widget.goal.targetAmount)} target',
                        style: AppTextStyles.caption),
                  ],
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: _amountCtrl,
                  autofocus: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    labelText: 'Amount to allocate (₹)',
                    prefixIcon:
                        const Icon(Icons.currency_rupee_rounded),
                    helperText: remaining > 0
                        ? '${Formatters.currency(remaining)} remaining to reach goal'
                        : 'Goal already reached!',
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Required';
                    final n = double.tryParse(v);
                    if (n == null || n < 1) return 'Min ₹1';
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  'This creates a GOAL_ALLOCATION transaction in your ledger.',
                  style: AppTextStyles.caption,
                ),
                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.savings_rounded, size: 18),
                  label: const Text('Allocate Funds'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
