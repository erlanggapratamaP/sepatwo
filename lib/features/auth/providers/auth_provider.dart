import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sepatwo/data/datasource/auth/auth_remote_datasource.dart';
import 'package:sepatwo/data/repository/auth_repository_impl.dart';
import 'package:sepatwo/domain/repository/auth_repository.dart';
import 'package:sepatwo/features/auth/states/auth_state.dart';
part 'auth_provider.g.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  // Use dummy implementation for development/testing
  // Switch to AuthRemoteDataSourceImpl() when API is ready
  return AuthRemoteDatasourceImpl();
});
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDatasource = ref.watch(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(remoteDatasource);
});

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthState> build() {
    return const AuthState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    debugPrint('AuthNotifier - Starting login process');
    state = const AsyncValue.loading();

    try {
      final repo = ref.read(authRepositoryProvider);
      final result = await repo.signIn(email, password);

      result.fold(
        (failure) {
          debugPrint('AuthNotifier - Login failed: ${failure.message}');
          state = AsyncValue.data(AuthState.unauthenticated(failure.message));
        },
        (userResponse) {
          debugPrint(
            'AuthNotifier - Login successful: ${userResponse.user?.name ?? 'Unknown User'}',
          );
          state = AsyncValue.data(AuthState.authenticated(userResponse));
        },
      );
    } catch (e) {
      debugPrint('AuthNotifier - Login exception: ${e.toString()}');
      state = AsyncValue.data(
        AuthState.unauthenticated('Login failed: ${e.toString()}'),
      );
    }
  }

  Future<void> signup({required String email, required String password}) async {
    debugPrint('AuthNotifier - Starting signup process');
    state = const AsyncValue.loading();

    try {
      final repo = ref.read(authRepositoryProvider);
      final result = await repo.signUp(email, password);

      result.fold(
        (failure) {
          debugPrint('AuthNotifier - Signup failed: ${failure.message}');
          state = AsyncValue.data(AuthState.unauthenticated(failure.message));
        },
        (_) {
          debugPrint('AuthNotifier - Signup successful');
          state = AsyncValue.data(
            const AuthState.unauthenticated(
              'Registration successful. Please login.',
            ),
          );
        },
      );
    } catch (e) {
      debugPrint('AuthNotifier - Signup exception: ${e.toString()}');
      state = AsyncValue.data(
        AuthState.unauthenticated('Signup failed: ${e.toString()}'),
      );
    }
  }

  Future<void> logout() async {
    debugPrint('AuthNotifier - Starting logout process');
    state = const AsyncValue.loading();

    try {
      final repo = ref.read(authRepositoryProvider);
      final result = await repo.signOut();

      result.fold(
        (failure) {
          debugPrint('AuthNotifier - Logout failed: ${failure.message}');
          // Even if logout fails, we should clear local state
          state = AsyncValue.data(
            const AuthState.unauthenticated('Logged out'),
          );
        },
        (_) {
          debugPrint('AuthNotifier - Logout successful');
          state = AsyncValue.data(
            const AuthState.unauthenticated('Logged out'),
          );
        },
      );
    } catch (e) {
      debugPrint('AuthNotifier - Logout exception: ${e.toString()}');
      // Even if logout fails, we should clear local state
      state = AsyncValue.data(const AuthState.unauthenticated('Logged out'));
    }
  }
}
