import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../shared/models/cart_model.dart';
import 'providers/cart_provider.dart';
import '../payment/screens/payment_screen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          if (cart.isNotEmpty)
            TextButton(
              onPressed: () => _showClearCartDialog(context, ref),
              child: const Text('Clear All'),
            ),
        ],
      ),
      body:
          cart.isEmpty
              ? _buildEmptyCart(context)
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return _CartItemCard(
                          item: item,
                          onQuantityChanged: (newQuantity) {
                            ref
                                .read(cartProvider.notifier)
                                .updateQuantity(item.id, newQuantity);
                          },
                          onRemove: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeFromCart(item.id);
                          },
                        );
                      },
                    ),
                  ),
                  _buildCartSummary(context, cart, currencyFormatter),
                ],
              ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 120,
              color: AppTheme.veryLightGrey,
            ),
            const SizedBox(height: AppConstants.spacing24),
            Text(
              'Your cart is empty',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              'Add some products to get started',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: AppTheme.secondaryText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.spacing32),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to products
              },
              child: const Text('Start Shopping'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary(
    BuildContext context,
    Cart cart,
    NumberFormat formatter,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      decoration: BoxDecoration(
        color: AppTheme.primaryWhite,
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowGrey,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Summary Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal (${cart.totalItems} items)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  formatter.format(cart.subtotal),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            if (cart.totalDiscount > 0) ...[
              const SizedBox(height: AppConstants.spacing8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                  Text(
                    '-${formatter.format(cart.totalDiscount)}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppTheme.success,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
            const Divider(height: AppConstants.spacing24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  formatter.format(cart.total),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to checkout
                  _showCheckoutDialog(context, cart.total);
                },
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCartDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Clear Cart'),
            content: const Text(
              'Are you sure you want to remove all items from your cart?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).clearCart();
                  Navigator.of(context).pop();
                },
                child: const Text('Clear All'),
              ),
            ],
          ),
    );
  }

  void _showCheckoutDialog(BuildContext context, double totalAmount) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => PaymentScreen(
              amount: totalAmount,
              currency: 'IDR',
              description: 'Pembayaran sepatu',
            ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const _CartItemCard({
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.spacing12),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing12),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
              child: SizedBox(
                width: 80,
                height: 80,
                child: CachedNetworkImage(
                  imageUrl: item.shoe.images.first,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        color: AppTheme.backgroundGrey,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppTheme.primaryBlack,
                          ),
                        ),
                      ),
                  errorWidget:
                      (context, url, error) => Container(
                        color: AppTheme.backgroundGrey,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          color: AppTheme.veryLightGrey,
                        ),
                      ),
                ),
              ),
            ),

            const SizedBox(width: AppConstants.spacing12),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.shoe.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Text(
                    item.shoe.brand.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppTheme.secondaryText,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Row(
                    children: [
                      Text(
                        'Size: ${item.selectedSize}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: AppConstants.spacing12),
                      Text(
                        'Color: ${item.selectedColor}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currencyFormatter.format(item.shoe.price),
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (item.shoe.originalPrice > item.shoe.price)
                            Text(
                              currencyFormatter.format(item.shoe.originalPrice),
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                color: AppTheme.secondaryText,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          // Quantity Controls
                          _QuantityButton(
                            icon: Icons.remove,
                            onPressed:
                                item.quantity > 1
                                    ? () => onQuantityChanged(item.quantity - 1)
                                    : null,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.spacing12,
                            ),
                            child: Text(
                              '${item.quantity}',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          _QuantityButton(
                            icon: Icons.add,
                            onPressed:
                                () => onQuantityChanged(item.quantity + 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppConstants.spacing8),

            // Remove Button
            IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Icons.delete_outline,
                color: AppTheme.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _QuantityButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: BorderSide(
            color:
                onPressed != null ? AppTheme.primaryBlack : AppTheme.borderGrey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
          ),
        ),
        child: Icon(
          icon,
          size: AppConstants.iconSize16,
          color:
              onPressed != null
                  ? AppTheme.primaryBlack
                  : AppTheme.veryLightGrey,
        ),
      ),
    );
  }
}
