import 'package:dartz/dartz.dart';
import 'package:sepatwo/core/error/failures.dart';
import 'package:sepatwo/data/model/user/user_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserResponseModel>> signIn(
    String email,
    String password,
  );
  Future<Either<Failure, void>> signUp(String email, String password);
  Future<Either<Failure, void>> signOut();
}
