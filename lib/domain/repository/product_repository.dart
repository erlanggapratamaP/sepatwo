import 'package:dartz/dartz.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/model/product_response_model/product_response_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseModel>> getProducts();
}
