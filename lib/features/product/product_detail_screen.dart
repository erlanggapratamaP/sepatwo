import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import 'providers/product_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(shoeByIdProvider(productId));

    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: AppBar(title: const Text('Product Details')),
      body: productAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: AppConstants.iconSize48,
                    color: AppTheme.secondaryText,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'Failed to load product',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  ElevatedButton(
                    onPressed: () => ref.refresh(shoeByIdProvider(productId)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
        data: (product) {
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.spacing32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'Product details will be implemented here',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.secondaryText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
