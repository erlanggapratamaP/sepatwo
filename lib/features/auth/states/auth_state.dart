import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sepatwo/data/model/user/user_response_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserResponseModel user) =
      _Authenticated;
  const factory AuthState.unauthenticated(String message) = _Unauthenticated;
}
