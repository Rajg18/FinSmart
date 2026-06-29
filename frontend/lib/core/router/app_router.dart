import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/transactions/presentation/screens/transactions_screen.dart';
import '../../features/budgets/presentation/screens/budgets_screen.dart';
import '../../features/goals/presentation/screens/goals_screen.dart';
import '../../features/subscriptions/presentation/screens/subscriptions_screen.dart';
import '../../features/analytics/presentation/screens/analytics_screen.dart';
import '../widgets/shell_scaffold.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authState.value ?? false;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (!isLoggedIn && !isAuthRoute) return '/login';
      if (isLoggedIn && isAuthRoute) return '/dashboard';
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
      ShellRoute(
        builder: (context, state, child) => ShellScaffold(child: child),
        routes: [
          GoRoute(path: '/dashboard', builder: (_, __) => const DashboardScreen()),
          GoRoute(path: '/transactions', builder: (_, __) => const TransactionsScreen()),
          GoRoute(path: '/budgets', builder: (_, __) => const BudgetsScreen()),
          GoRoute(path: '/goals', builder: (_, __) => const GoalsScreen()),
          GoRoute(path: '/subscriptions', builder: (_, __) => const SubscriptionsScreen()),
          GoRoute(path: '/analytics', builder: (_, __) => const AnalyticsScreen()),
        ],
      ),
    ],
  );
}
