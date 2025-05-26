import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/payment_model.dart';
import '../../../core/services/payment_service.dart';

part 'payment_provider.g.dart';

@riverpod
class Payment extends _$Payment {
  @override
  FutureOr<PaymentModel?> build() {
    return null;
  }

  Future<void> processPayment({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvn,
    required double amount,
    required String currency,
    required String description,
    Map<String, String>? metadata,
  }) async {
    state = const AsyncLoading();

    try {
      final paymentService = ref.read(paymentServiceProvider);
      // Create token
      final token = await paymentService.createCardToken(
        apiKey: 'YOUR_XENDIT_API_KEY',
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        cvn: cvn,
      );

      // Create charge
      final charge = await paymentService.createCardCharge(
        apiKey: 'YOUR_XENDIT_API_KEY',
        tokenId: token.data['id'],
        amount: amount,
        currency: currency,
        description: description,
        metadata: metadata ?? {},
      );

      // Create payment model
      final payment = PaymentModel(
        id: charge.data['id'],
        amount: amount,
        currency: currency,
        status: charge.data['status'],
        paymentMethod: 'creditCard',
        createdAt: DateTime.now(),
        description: description,
        metadata: metadata,
      );

      state = AsyncData(payment);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> checkPaymentStatus(String chargeId) async {
    try {
      final paymentService = ref.read(paymentServiceProvider);
      final response = await paymentService.getInvoiceStatus(
        apiKey: 'YOUR_XENDIT_API_KEY',
        invoiceId: chargeId,
      );

      if (state.value != null) {
        final updatedPayment = state.value!.copyWith(
          status: response.data['status'],
        );
        state = AsyncData(updatedPayment);
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
