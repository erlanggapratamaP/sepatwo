import 'package:dartz/dartz.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/model/category_response_model/category_response_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryResponseModel>> getCategories();
}
