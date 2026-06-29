import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../models/dashboard_models.dart';

part 'dashboard_repository.g.dart';

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepository(ref.watch(dioClientProvider));
}

class DashboardRepository {
  final Dio _dio;
  DashboardRepository(this._dio);

  Future<DashboardResponse> getDashboard() async {
    try {
      final res = await _dio.get(ApiConstants.dashboard);
      return DashboardResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<BankFeedResponse> syncBankFeed() async {
    try {
      final res = await _dio.post(ApiConstants.bankFeed);
      return BankFeedResponse.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
