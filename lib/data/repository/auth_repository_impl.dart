import 'package:dartz/dartz.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/datasource/auth/auth_remote_datasource.dart';
import 'package:sepatwo/data/model/user/user_response_model.dart';
import 'package:sepatwo/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  AuthRepositoryImpl(this._remoteDatasource);
  @override
  Future<Either<Failure, UserResponseModel>> signIn(
    String email,
    String password,
  ) async {
    return await _remoteDatasource.signIn(email, password);
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    return await _remoteDatasource.signOut();
  }

  @override
  Future<Either<Failure, void>> signUp(String email, String password) async {
    return await _remoteDatasource.signUp(email, password);
  }
}
