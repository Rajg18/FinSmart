import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/loading_overlay.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      await ref
          .read(authNotifierProvider.notifier)
          .login(_usernameCtrl.text.trim(), _passCtrl.text);
      if (mounted) context.go('/dashboard');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: AppColors.danger),
        );
      }
    }
  }

  Future<void> _demo() async {
    try {
      await ref.read(authNotifierProvider.notifier).loginDemo();
      if (mounted) context.go('/dashboard');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: AppColors.danger),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LoadingOverlay(
        isLoading: isLoading,
        child: Row(
          children: [
            // Left hero panel
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0A1628), Color(0xFF0F2347)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: AppColors.accentGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 28),
                      ),
                      const SizedBox(height: 40),
                      Text('FinSmart', style: AppTextStyles.displayLarge.copyWith(fontSize: 42)),
                      const SizedBox(height: 16),
                      Text(
                        'Your intelligent\npersonal finance\ncompanion.',
                        style: AppTextStyles.displayMedium.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 48),
                      _FeatureRow(icon: Icons.track_changes_rounded, text: 'Track every rupee with precision'),
                      const SizedBox(height: 16),
                      _FeatureRow(icon: Icons.account_balance_wallet_rounded, text: 'Smart budget alerts & goals'),
                      const SizedBox(height: 16),
                      _FeatureRow(icon: Icons.bar_chart_rounded, text: 'Rich analytics & spending trends'),
                    ],
                  ),
                ),
              ),
            ),
            // Right form panel
            Container(
              width: 480,
              padding: const EdgeInsets.all(60),
              color: AppColors.surface,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Welcome back', style: AppTextStyles.displayMedium),
                        const SizedBox(height: 8),
                        Text('Sign in to your account', style: AppTextStyles.bodyMedium),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _usernameCtrl,
                          style: const TextStyle(color: AppColors.textPrimary),
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person_outline_rounded),
                          ),
                          validator: (v) => Validators.required(v, field: 'Username'),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passCtrl,
                          obscureText: _obscure,
                          style: const TextStyle(color: AppColors.textPrimary),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                color: AppColors.textSecondary,
                              ),
                              onPressed: () => setState(() => _obscure = !_obscure),
                            ),
                          ),
                          validator: Validators.password,
                          onFieldSubmitted: (_) => _login(),
                        ),
                        const SizedBox(height: 28),
                        ElevatedButton(
                          onPressed: isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Sign In'),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: isLoading ? null : _demo,
                          icon: const Icon(Icons.play_arrow_rounded, size: 18),
                          label: const Text('Try Demo Account'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.accentLight,
                            side: const BorderSide(color: AppColors.surfaceBorder),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ", style: AppTextStyles.bodyMedium),
                            TextButton(
                              onPressed: () => context.go('/register'),
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.accentLight, size: 16),
        ),
        const SizedBox(width: 12),
        Text(text, style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary)),
      ],
    );
  }
}
