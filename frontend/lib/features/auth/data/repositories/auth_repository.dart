import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_models.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref.watch(dioClientProvider), ref.watch(secureStorageProvider));
}

class AuthRepository {
  final Dio _dio;
  final dynamic _storage;

  AuthRepository(this._dio, this._storage);

  Future<AuthResponse> login(LoginRequest req) async {
    try {
      final res = await _dio.post(ApiConstants.login, data: req.toJson());
      final auth = AuthResponse.fromJson(res.data as Map<String, dynamic>);
      await _saveAuth(auth);
      return auth;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> register(RegisterRequest req) async {
    try {
      await _dio.post(ApiConstants.register, data: req.toJson());
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<AuthResponse> loginDemo() async {
    try {
      final res = await _dio.post(ApiConstants.demo);
      final auth = AuthResponse.fromJson(res.data as Map<String, dynamic>);
      await _saveAuth(auth);
      return auth;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(ApiConstants.logout);
    } catch (_) {}
    await _storage.deleteAll();
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: StorageKeys.accessToken);
    return token != null && token.isNotEmpty;
  }

  Future<void> _saveAuth(AuthResponse auth) async {
    await _storage.write(key: StorageKeys.accessToken, value: auth.token);
    await _storage.write(key: StorageKeys.userUsername, value: auth.username);
    await _storage.write(key: StorageKeys.userName, value: auth.name);
    await _storage.write(key: StorageKeys.userRole, value: auth.role);
  }
}
