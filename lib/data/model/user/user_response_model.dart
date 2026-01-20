import 'user.dart';

class UserResponseModel {
  String? accessToken;
  User? user;

  UserResponseModel({this.accessToken, this.user});

  @override
  String toString() {
    return 'UserResponseModel(accessToken: $accessToken, user: $user)';
  }

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      accessToken: json['access_token'] as String?,
      user:
          json['user'] == null
              ? null
              : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'user': user?.toJson(),
  };

  UserResponseModel copyWith({String? accessToken, User? user}) {
    return UserResponseModel(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }
}
