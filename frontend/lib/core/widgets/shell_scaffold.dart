import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ShellScaffold extends ConsumerWidget {
  final Widget child;
  const ShellScaffold({super.key, required this.child});

  static const _navItems = [
    _NavItem(icon: Icons.dashboard_rounded, label: 'Dashboard', path: '/dashboard'),
    _NavItem(icon: Icons.receipt_long_rounded, label: 'Transactions', path: '/transactions'),
    _NavItem(icon: Icons.account_balance_wallet_rounded, label: 'Budgets', path: '/budgets'),
    _NavItem(icon: Icons.flag_rounded, label: 'Goals', path: '/goals'),
    _NavItem(icon: Icons.repeat_rounded, label: 'Subscriptions', path: '/subscriptions'),
    _NavItem(icon: Icons.bar_chart_rounded, label: 'Analytics', path: '/analytics'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).matchedLocation;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Row(
        children: [
          _SideNav(
            currentPath: location,
            onLogout: () async {
              await ref.read(authNotifierProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _SideNav extends StatelessWidget {
  final String currentPath;
  final VoidCallback onLogout;
  const _SideNav({required this.currentPath, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(right: BorderSide(color: AppColors.surfaceBorder)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppColors.accentGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 10),
                Text('FinSmart', style: AppTextStyles.headingLarge),
              ],
            ),
          ),
          // Nav items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: ShellScaffold._navItems
                  .map((item) => _NavTile(
                        item: item,
                        isActive: currentPath.startsWith(item.path),
                      ))
                  .toList(),
            ),
          ),
          // Bottom logout
          Padding(
            padding: const EdgeInsets.all(12),
            child: _NavTile(
              item: const _NavItem(
                icon: Icons.logout_rounded,
                label: 'Logout',
                path: '/logout',
              ),
              isActive: false,
              onTap: onLogout,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavTile({required this.item, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap ?? () => context.go(item.path),
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            decoration: BoxDecoration(
              color: isActive ? AppColors.accent.withValues(alpha: 0.15) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isActive ? AppColors.accent.withValues(alpha: 0.4) : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 18,
                  color: isActive ? AppColors.accentLight : AppColors.textSecondary,
                ),
                const SizedBox(width: 10),
                Text(
                  item.label,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: isActive ? AppColors.accentLight : AppColors.textSecondary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
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

class _NavItem {
  final IconData icon;
  final String label;
  final String path;
  const _NavItem({required this.icon, required this.label, required this.path});
}
