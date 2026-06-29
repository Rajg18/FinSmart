import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/transaction_models.dart';

part 'transaction_repository.g.dart';

@riverpod
TransactionRepository transactionRepository(Ref ref) =>
    TransactionRepository(ref.watch(dioClientProvider));

class TransactionRepository {
  final Dio _dio;
  TransactionRepository(this._dio);

  Future<TransactionPage> getAll({
    String? type,
    String? category,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final res = await _dio.get(
        ApiConstants.transactions,
        queryParameters: {
          if (type != null) 'type': type,
          if (category != null) 'category': category,
          'page': page,
          'size': size,
        },
      );
      return TransactionPage.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<TransactionItem> create(TransactionRequest req) async {
    try {
      final res = await _dio.post(ApiConstants.transactions, data: req.toJson());
      return TransactionItem.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<TransactionItem> update(int id, TransactionRequest req) async {
    try {
      final res = await _dio.put('${ApiConstants.transactions}/$id', data: req.toJson());
      return TransactionItem.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _dio.delete('${ApiConstants.transactions}/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
