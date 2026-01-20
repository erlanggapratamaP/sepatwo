import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sepatwo/core/constants/app_constants.dart';
import 'package:sepatwo/core/error/exceptions.dart';
import 'package:sepatwo/data/model/user/user_response_model.dart';
import 'package:sepatwo/service/secure_storage_service.dart';
import 'package:sepatwo/service/storage_service.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserResponseModel user);
  Future<UserResponseModel> getLastUser();
  Future<void> clearUserCache();
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<void> cacheCredentials(String username, String password);
  Future<Map<String, String>?> getCredentials();
  Future<void> clearCredentials();
  Future<void> clearAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final StorageService _storageService;
  final SecureStorageService _secureStorageService;

  AuthLocalDataSourceImpl(this._storageService, this._secureStorageService);

  @override
  Future<void> cacheUser(UserResponseModel user) async {
    try {
      final userJson = json.encode(user.toJson());
      await _storageService.setString(AppConstants.userKey, userJson);
    } catch (e) {
      throw CacheException('Failed to cache user: $e');
    }
  }

  @override
  Future<UserResponseModel> getLastUser() async {
    try {
      final userJson = _storageService.getString(AppConstants.userKey);
      if (userJson != null) {
        final userMap = json.decode(userJson) as Map<String, dynamic>;
        return UserResponseModel.fromJson(userMap);
      } else {
        throw const CacheException('No user found in cache');
      }
    } catch (e) {
      throw CacheException('Failed to get user from cache: $e');
    }
  }

  @override
  Future<void> clearUserCache() async {
    try {
      debugPrint('AuthLocalDataSource - Clearing user cache');
      await _storageService.remove(AppConstants.userKey);
      debugPrint('AuthLocalDataSource - User cache cleared successfully');
    } catch (e) {
      debugPrint('AuthLocalDataSource - Failed to clear user cache: $e');
      throw CacheException('Failed to clear user cache: $e');
    }
  }

  @override
  Future<void> cacheToken(String token) async {
    try {
      await _secureStorageService.write(AppConstants.tokenKey, token);
    } catch (e) {
      throw CacheException('Failed to cache token: $e');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await _secureStorageService.read(AppConstants.tokenKey);
    } catch (e) {
      throw CacheException('Failed to get token from cache: $e');
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      debugPrint('AuthLocalDataSource - Clearing token');
      await _secureStorageService.delete(AppConstants.tokenKey);
      debugPrint('AuthLocalDataSource - Token cleared successfully');
    } catch (e) {
      debugPrint('AuthLocalDataSource - Failed to clear token: $e');
      throw CacheException('Failed to clear token: $e');
    }
  }

  @override
  Future<void> cacheCredentials(String email, String password) async {
    try {
      await _secureStorageService.write(AppConstants.emailKey, email);
      await _secureStorageService.write(AppConstants.passwordKey, password);
    } catch (e) {
      throw CacheException('Failed to cache credentials: $e');
    }
  }

  @override
  Future<Map<String, String>?> getCredentials() async {
    try {
      final email = await _secureStorageService.read(AppConstants.emailKey);
      final password = await _secureStorageService.read(
        AppConstants.passwordKey,
      );

      if (email != null && password != null) {
        return {'email': email, 'password': password};
      }
      return null;
    } catch (e) {
      throw CacheException('Failed to get credentials from cache: $e');
    }
  }

  @override
  Future<void> clearCredentials() async {
    try {
      debugPrint('AuthLocalDataSource - Clearing credentials');
      await _secureStorageService.delete(AppConstants.emailKey);
      await _secureStorageService.delete(AppConstants.passwordKey);
      debugPrint('AuthLocalDataSource - Credentials cleared successfully');
    } catch (e) {
      debugPrint('AuthLocalDataSource - Failed to clear credentials: $e');
      throw CacheException('Failed to clear credentials: $e');
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      debugPrint('AuthLocalDataSource - Clearing all data');
      await clearUserCache();
      await clearToken();
      await clearCredentials();
      debugPrint('AuthLocalDataSource - All data cleared successfully');
    } catch (e) {
      debugPrint('AuthLocalDataSource - Failed to clear all data: $e');
      throw CacheException('Failed to clear all cache: $e');
    }
  }
}
