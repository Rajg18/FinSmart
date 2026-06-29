import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/analytics_models.dart';

part 'analytics_repository.g.dart';

@riverpod
AnalyticsRepository analyticsRepository(Ref ref) =>
    AnalyticsRepository(ref.watch(dioClientProvider));

class AnalyticsRepository {
  final Dio _dio;
  AnalyticsRepository(this._dio);

  Future<CategoryBreakdownResponse> getCategoryBreakdown(
      int month, int year) async {
    try {
      final res = await _dio.get(ApiConstants.analyticsCategory,
          queryParameters: {'month': month, 'year': year});
      return CategoryBreakdownResponse.fromJson(
          res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<MonthlyComparisonResponse> getMonthlyComparison(
      int month1, int year1, int month2, int year2) async {
    try {
      final res = await _dio.get(ApiConstants.analyticsMonthly,
          queryParameters: {
            'month1': month1,
            'year1': year1,
            'month2': month2,
            'year2': year2
          });
      return MonthlyComparisonResponse.fromJson(
          res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<SpendingTrendResponse> getSpendingTrend(int months) async {
    try {
      final res = await _dio.get(ApiConstants.analyticsTrend,
          queryParameters: {'months': months});
      return SpendingTrendResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<TopMerchantsResponse> getTopMerchants(
      int month, int year, int limit) async {
    try {
      final res = await _dio.get(ApiConstants.analyticsTopMerchants,
          queryParameters: {'month': month, 'year': year, 'limit': limit});
      return TopMerchantsResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
