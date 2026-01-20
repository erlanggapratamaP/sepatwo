import 'package:dio/dio.dart';
import 'exceptions.dart';

/// Utility class for handling Dio exceptions and converting them to ServerException
class DioExceptionHandler {
  /// Converts a DioException to a ServerException with appropriate error message
  static ServerException handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerException(
          message: 'Connection timeout. Please check your internet connection.',
          statusCode: 0,
        );
      case DioExceptionType.sendTimeout:
        return const ServerException(
          message: 'Send timeout. Please check your internet connection.',
          statusCode: 0,
        );
      case DioExceptionType.receiveTimeout:
        return const ServerException(
          message: 'Receive timeout. Please check your internet connection.',
          statusCode: 0,
        );
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        final message =
            e.response?.data?['message'] ??
            e.response?.statusMessage ??
            'Server error occurred';
        return ServerException(message: message, statusCode: statusCode);
      case DioExceptionType.cancel:
        return const ServerException(
          message: 'Request was cancelled',
          statusCode: 0,
        );
      case DioExceptionType.connectionError:
        return const ServerException(
          message: 'Connection error. Please check your internet connection.',
          statusCode: 0,
        );
      case DioExceptionType.badCertificate:
        return const ServerException(
          message: 'Bad certificate. Please contact support.',
          statusCode: 0,
        );
      case DioExceptionType.unknown:
        return ServerException(
          message: e.message ?? 'Unknown error occurred',
          statusCode: 0,
        );
    }
  }
}
