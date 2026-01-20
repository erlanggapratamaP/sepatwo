import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/model/category_response_model/category_response_model.dart';

abstract class CategoryRemoteDatasource {
  Future<Either<Failure, CategoryResponseModel>> getCategories();
}

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final Dio _dio;
  CategoryRemoteDatasourceImpl(this._dio);
  @override
  Future<Either<Failure, CategoryResponseModel>> getCategories() async {
    try {
      var response = await _dio.get(
        '/categories',
        options: Options(contentType: 'application/json'),
      );

      if (response.statusCode == 200) {
        try {
          final productResponse = CategoryResponseModel.fromJson(response.data);
          return Right(productResponse);
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
}
