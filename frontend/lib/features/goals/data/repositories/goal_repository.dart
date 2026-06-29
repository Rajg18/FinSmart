import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/goal_models.dart';

part 'goal_repository.g.dart';

@riverpod
GoalRepository goalRepository(Ref ref) =>
    GoalRepository(ref.watch(dioClientProvider));

class GoalRepository {
  final Dio _dio;
  GoalRepository(this._dio);

  Future<List<GoalResponse>> getAll() async {
    try {
      final res = await _dio.get(ApiConstants.goals);
      return (res.data as List)
          .map((e) => GoalResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<GoalResponse> create(GoalRequest req) async {
    try {
      final res = await _dio.post(ApiConstants.goals, data: req.toJson());
      return GoalResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<GoalResponse> update(int id, GoalRequest req) async {
    try {
      final res =
          await _dio.put('${ApiConstants.goals}/$id', data: req.toJson());
      return GoalResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<GoalResponse> allocate(int id, GoalAllocationRequest req) async {
    try {
      final res = await _dio.post(
          '${ApiConstants.goals}/$id/allocate',
          data: req.toJson());
      return GoalResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _dio.delete('${ApiConstants.goals}/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
