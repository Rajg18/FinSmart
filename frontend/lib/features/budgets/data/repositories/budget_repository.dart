import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/budget_models.dart';

part 'budget_repository.g.dart';

@riverpod
BudgetRepository budgetRepository(Ref ref) =>
    BudgetRepository(ref.watch(dioClientProvider));

class BudgetRepository {
  final Dio _dio;
  BudgetRepository(this._dio);

  Future<List<BudgetResponse>> getAll() async {
    try {
      final res = await _dio.get(ApiConstants.budgets);
      return (res.data as List)
          .map((e) => BudgetResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<BudgetResponse> create(BudgetRequest req) async {
    try {
      final res = await _dio.post(ApiConstants.budgets, data: req.toJson());
      return BudgetResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<BudgetResponse> update(int id, BudgetRequest req) async {
    try {
      final res =
          await _dio.put('${ApiConstants.budgets}/$id', data: req.toJson());
      return BudgetResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _dio.delete('${ApiConstants.budgets}/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
