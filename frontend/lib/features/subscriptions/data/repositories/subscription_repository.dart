import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/subscription_models.dart';

part 'subscription_repository.g.dart';

@riverpod
SubscriptionRepository subscriptionRepository(Ref ref) =>
    SubscriptionRepository(ref.watch(dioClientProvider));

class SubscriptionRepository {
  final Dio _dio;
  SubscriptionRepository(this._dio);

  Future<SubscriptionSummaryResponse> getSummary() async {
    try {
      final res = await _dio.get('${ApiConstants.subscriptions}/summary');
      return SubscriptionSummaryResponse.fromJson(
          res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<List<SubscriptionResponse>> getAll({bool activeOnly = false}) async {
    try {
      final res = await _dio.get(ApiConstants.subscriptions,
          queryParameters: {'activeOnly': activeOnly});
      return (res.data as List)
          .map((e) =>
              SubscriptionResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<SubscriptionResponse> create(SubscriptionRequest req) async {
    try {
      final res = await _dio.post(ApiConstants.subscriptions, data: req.toJson());
      return SubscriptionResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<SubscriptionResponse> update(int id, SubscriptionRequest req) async {
    try {
      final res = await _dio.put(
          '${ApiConstants.subscriptions}/$id', data: req.toJson());
      return SubscriptionResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<SubscriptionResponse> toggle(int id) async {
    try {
      final res =
          await _dio.patch('${ApiConstants.subscriptions}/$id/toggle');
      return SubscriptionResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _dio.delete('${ApiConstants.subscriptions}/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
