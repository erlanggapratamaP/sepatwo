import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService();
});

class PaymentService {
  final Dio _dio = Dio();

  Future<Response> createInvoice({
    required String apiKey,
    required double amount,
    required String payerEmail,
    required String description,
  }) async {
    final response = await _dio.post(
      'https://api.xendit.co/v2/invoices',
      data: {
        'external_id': DateTime.now().millisecondsSinceEpoch.toString(),
        'amount': amount,
        'payer_email': payerEmail,
        'description': description,
      },
      options: Options(
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:'))}',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }

  Future<Response> getInvoiceStatus({
    required String apiKey,
    required String invoiceId,
  }) async {
    final response = await _dio.get(
      'https://api.xendit.co/v2/invoices/$invoiceId',
      options: Options(
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:'))}',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }

  Future<Response> createCardToken({
    required String apiKey,
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvn,
  }) async {
    final response = await _dio.post(
      'https://api.xendit.co/v2/credit_card_tokens',
      data: {
        'card_number': cardNumber,
        'expiry_month': expiryMonth,
        'expiry_year': expiryYear,
        'cvn': cvn,
      },
      options: Options(
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:'))}',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }

  Future<Response> createCardCharge({
    required String apiKey,
    required String tokenId,
    required double amount,
    required String currency,
    required String description,
    Map<String, String>? metadata,
  }) async {
    final response = await _dio.post(
      'https://api.xendit.co/v2/credit_card_charges',
      data: {
        'token_id': tokenId,
        'amount': amount,
        'currency': currency,
        'description': description,
        'metadata': metadata,
      },
      options: Options(
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:'))}',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }
}
