import 'package:sepatwo/data/model/user/user_response_model.dart';
import 'package:sepatwo/service/secure_storage_service.dart';
import 'package:sepatwo/service/storage_service.dart';

import 'auth_local_datasource.dart';

/// Lazy wrapper for AuthLocalDataSource that handles async initialization
class AuthLocalDataSourceLazy implements AuthLocalDataSource {
  AuthLocalDataSourceImpl? _instance;

  Future<AuthLocalDataSourceImpl> _getInstance() async {
    if (_instance == null) {
      final storageService = await StorageService.getInstance();
      final secureStorageService = SecureStorageService.getInstance();
      _instance = AuthLocalDataSourceImpl(storageService, secureStorageService);
    }
    return _instance!;
  }

  @override
  Future<void> cacheUser(UserResponseModel user) async {
    final instance = await _getInstance();
    return instance.cacheUser(user);
  }

  @override
  Future<UserResponseModel> getLastUser() async {
    final instance = await _getInstance();
    return instance.getLastUser();
  }

  @override
  Future<void> clearUserCache() async {
    final instance = await _getInstance();
    return instance.clearUserCache();
  }

  @override
  Future<void> cacheToken(String token) async {
    final instance = await _getInstance();
    return instance.cacheToken(token);
  }

  @override
  Future<String?> getToken() async {
    final instance = await _getInstance();
    return instance.getToken();
  }

  @override
  Future<void> clearToken() async {
    final instance = await _getInstance();
    return instance.clearToken();
  }

  @override
  Future<void> cacheCredentials(String username, String password) async {
    final instance = await _getInstance();
    return instance.cacheCredentials(username, password);
  }

  @override
  Future<Map<String, String>?> getCredentials() async {
    final instance = await _getInstance();
    return instance.getCredentials();
  }

  @override
  Future<void> clearCredentials() async {
    final instance = await _getInstance();
    return instance.clearCredentials();
  }

  @override
  Future<void> clearAll() async {
    final instance = await _getInstance();
    return instance.clearAll();
  }
}
