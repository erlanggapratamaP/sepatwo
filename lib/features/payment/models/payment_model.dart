import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    required double amount,
    required String currency,
    required String status,
    required String paymentMethod,
    required DateTime createdAt,
    String? description,
    Map<String, dynamic>? metadata,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

enum PaymentStatus { pending, processing, completed, failed, refunded }

enum PaymentMethod { creditCard, debitCard, bankTransfer, eWallet }
