import 'package:dartz/dartz.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/datasource/category/category_remote_datasource.dart';
import 'package:sepatwo/data/model/category_response_model/category_response_model.dart';
import 'package:sepatwo/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource _remoteDatasource;
  CategoryRepositoryImpl(this._remoteDatasource);
  @override
  Future<Either<Failure, CategoryResponseModel>> getCategories() async {
    return await _remoteDatasource.getCategories();
  }
}
