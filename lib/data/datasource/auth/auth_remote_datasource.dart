import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/core/network/dio_client.dart';
import 'package:sepatwo/data/model/user/user_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, UserResponseModel>> signIn(
    String email,
    String password,
  );
  Future<Either<Failure, void>> signUp(String email, String password);
  Future<Either<Failure, void>> signOut();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasourceImpl({Dio? dio}) : _dio = dio ?? DioClient.dio;

  @override
  Future<Either<Failure, UserResponseModel>> signIn(
    String email,
    String password,
  ) async {
    var data = {'email': email, 'password': password};
    try {
      var response = await _dio.post(
        '/login',
        data: data,
        options: Options(contentType: 'application/json'),
      );

      if (response.statusCode == 200) {
        try {
          final userResponse = UserResponseModel.fromJson(response.data);
          return Right(userResponse);
        } catch (e) {
          return const Left(UnknownFailure('Error parsing response data'));
        }
      } else {
        return Left(
          ServerFailure(
            message: 'Login failed',
            statusCode: response.statusCode ?? 500,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Left(NetworkFailure('No internet connection'));
      } else if (e.response != null) {
        return Left(
          ServerFailure(
            message: e.response?.data['message'] ?? 'Server error',
            statusCode: e.response?.statusCode ?? 500,
          ),
        );
      } else {
        return const Left(UnknownFailure('Unknown error occurred'));
      }
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      var response = await _dio.post(
        '/logout',
        options: Options(contentType: 'application/json'),
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          ServerFailure(
            message: 'Logout failed',
            statusCode: response.statusCode ?? 500,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Left(NetworkFailure('No internet connection'));
      } else if (e.response != null) {
        return Left(
          ServerFailure(
            message: e.response?.data['message'] ?? 'Server error',
            statusCode: e.response?.statusCode ?? 500,
          ),
        );
      } else {
        return const Left(UnknownFailure('Unknown error occurred'));
      }
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(String email, String password) async {
    var data = {'email': email, 'password': password};
    try {
      var response = await _dio.post(
        '/register',
        data: data,
        options: Options(contentType: 'application/json'),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          ServerFailure(
            message: 'Registration failed',
            statusCode: response.statusCode ?? 500,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Left(NetworkFailure('No internet connection'));
      } else if (e.response != null) {
        return Left(
          ServerFailure(
            message: e.response?.data['message'] ?? 'Server error',
            statusCode: e.response?.statusCode ?? 500,
          ),
        );
      } else {
        return const Left(UnknownFailure('Unknown error occurred'));
      }
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }
}
