import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/payment_provider.dart';
import '../../../core/theme/app_theme.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final double amount;
  final String currency;
  final String description;

  const PaymentScreen({
    super.key,
    required this.amount,
    required this.currency,
    required this.description,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryMonthController = TextEditingController();
  final _expiryYearController = TextEditingController();
  final _cvnController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryMonthController.dispose();
    _expiryYearController.dispose();
    _cvnController.dispose();
    super.dispose();
  }

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(paymentProvider.notifier)
          .processPayment(
            cardNumber: _cardNumberController.text,
            expiryMonth: _expiryMonthController.text,
            expiryYear: _expiryYearController.text,
            cvn: _cvnController.text,
            amount: widget.amount,
            currency: widget.currency,
            description: widget.description,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Amount Summary
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${widget.currency} ${widget.amount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Card Details
              Text(
                'Card Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Card Number
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  hintText: '1234 5678 9012 3456',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter card number';
                  }
                  if (value.length < 16) {
                    return 'Card number must be 16 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Expiry Date
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryMonthController,
                      decoration: const InputDecoration(
                        labelText: 'Month',
                        hintText: 'MM',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        final month = int.tryParse(value);
                        if (month == null || month < 1 || month > 12) {
                          return 'Invalid month';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _expiryYearController,
                      decoration: const InputDecoration(
                        labelText: 'Year',
                        hintText: 'YY',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        final year = int.tryParse(value);
                        if (year == null || year < 23) {
                          return 'Invalid year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // CVN
              TextFormField(
                controller: _cvnController,
                decoration: const InputDecoration(
                  labelText: 'CVN',
                  hintText: '123',
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter CVN';
                  }
                  if (value.length < 3) {
                    return 'CVN must be 3 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Payment Button
              paymentState.when(
                data: (payment) {
                  if (payment == null) {
                    return ElevatedButton(
                      onPressed: _processPayment,
                      child: const Text('Pay Now'),
                    );
                  }
                  return Column(
                    children: [
                      Text(
                        'Payment Status: ${payment.status}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      if (payment.status == 'PENDING')
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(paymentProvider.notifier)
                                .checkPaymentStatus(payment.id);
                          },
                          child: const Text('Check Status'),
                        ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error:
                    (error, stack) => Text(
                      'Error: $error',
                      style: TextStyle(color: AppTheme.error),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
