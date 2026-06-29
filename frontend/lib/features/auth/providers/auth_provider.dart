import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/auth_models.dart';
import '../data/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
Future<bool> authState(Ref ref) async {
  final repo = ref.watch(authRepositoryProvider);
  return repo.isLoggedIn();
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<AuthResponse?> build() => const AsyncData(null);

  Future<AuthResponse> login(String username, String password) async {
    state = const AsyncLoading();
    final repo = ref.read(authRepositoryProvider);
    final result = await AsyncValue.guard(
      () => repo.login(LoginRequest(username: username, password: password)),
    );
    state = result;
    if (result.hasError) throw result.error!;
    ref.invalidate(authStateProvider);
    return result.value!;
  }

  Future<void> register(
    String username,
    String password,
    String email,
  ) async {
    state = const AsyncLoading();
    final repo = ref.read(authRepositoryProvider);
    final result = await AsyncValue.guard(
      () => repo.register(RegisterRequest(
        username: username,
        password: password,
        email: email,
      )),
    );
    state = const AsyncData(null);
    if (result.hasError) throw result.error!;
  }

  Future<AuthResponse> loginDemo() async {
    state = const AsyncLoading();
    final repo = ref.read(authRepositoryProvider);
    final result = await AsyncValue.guard(() => repo.loginDemo());
    state = result;
    if (result.hasError) throw result.error!;
    ref.invalidate(authStateProvider);
    return result.value!;
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    ref.invalidate(authStateProvider);
    state = const AsyncData(null);
  }
}
