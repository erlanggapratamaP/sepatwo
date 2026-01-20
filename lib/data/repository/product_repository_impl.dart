import 'package:dartz/dartz.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/datasource/product/product_remote_datasource.dart';
import 'package:sepatwo/data/model/product_response_model/product_response_model.dart';
import 'package:sepatwo/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource _remoteDatasource;
  ProductRepositoryImpl(this._remoteDatasource);
  @override
  Future<Either<Failure, ProductResponseModel>> getProducts() async {
    return await _remoteDatasource.getProducts();
  }
}
