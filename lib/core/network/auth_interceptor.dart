import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sepatwo/data/datasource/auth/auth_local_datasource.dart';

/// Interceptor that automatically adds authentication token to requests
class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _authLocalDataSource;

  AuthInterceptor(this._authLocalDataSource);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _authLocalDataSource.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Log the error but don't block the request
      debugPrint('AuthInterceptor - Failed to get token: $e');
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized responses
    if (err.response?.statusCode == 401) {
      // Token might be expired, clear it
      _clearExpiredToken();
    }
    super.onError(err, handler);
  }

  Future<void> _clearExpiredToken() async {
    try {
      await _authLocalDataSource.clearToken();
      debugPrint('AuthInterceptor - Cleared expired token');
    } catch (e) {
      debugPrint('AuthInterceptor - Failed to clear token: $e');
    }
  }
}
