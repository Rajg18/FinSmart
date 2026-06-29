import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  factory ApiException.fromDioError(DioException e) {
    final data = e.response?.data;
    String msg;
    if (data is Map && data['message'] != null) {
      msg = data['message'].toString();
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      msg = 'Connection timed out. Check your network.';
    } else if (e.type == DioExceptionType.connectionError) {
      msg = 'Cannot connect to server. Make sure backend is running.';
    } else {
      msg = e.message ?? 'An unexpected error occurred';
    }
    return ApiException(msg, statusCode: e.response?.statusCode);
  }

  @override
  String toString() => message;
}
