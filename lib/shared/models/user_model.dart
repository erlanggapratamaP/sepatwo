import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? phone,
    String? avatar,
    DateTime? dateOfBirth,
    String? gender,
    List<Address>? addresses,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required String id,
    required String label,
    required String fullAddress,
    required String city,
    required String state,
    required String postalCode,
    required String country,
    required bool isDefault,
    String? recipientName,
    String? recipientPhone,
    String? notes,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
