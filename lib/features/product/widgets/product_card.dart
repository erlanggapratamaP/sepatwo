import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/models/shoe_model.dart';
import '../../cart/providers/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final Shoe shoe;
  final VoidCallback? onTap;
  final bool showAddToCart;

  const ProductCard({
    super.key,
    required this.shoe,
    this.onTap,
    this.showAddToCart = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Card(
      margin: const EdgeInsets.all(AppConstants.spacing8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Image
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadius8,
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: shoe.images.first,
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
                                size: AppConstants.iconSize48,
                              ),
                            ),
                      ),
                    ),
                  ),
                  // Discount Badge
                  if (shoe.discount != null)
                    Positioned(
                      top: AppConstants.spacing8,
                      left: AppConstants.spacing8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacing8,
                          vertical: AppConstants.spacing4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlack,
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius4,
                          ),
                        ),
                        child: Text(
                          shoe.discount!,
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(
                            color: AppTheme.primaryWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  // Stock Status
                  if (!shoe.inStock)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlack.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius8,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'OUT OF STOCK',
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              color: AppTheme.primaryWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: AppConstants.spacing8),

              // Brand
              Text(
                shoe.brand.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppTheme.secondaryText,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: AppConstants.spacing4),

              // Product Name
              Text(
                shoe.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: AppConstants.spacing4),

              // Rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: AppConstants.iconSize16,
                    color: AppTheme.primaryBlack,
                  ),
                  const SizedBox(width: AppConstants.spacing4),
                  Text(
                    shoe.rating.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacing4),
                  Text(
                    '(${shoe.reviewCount})',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ],
              ),

              // Price and Add to Cart
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Current Price
                        Text(
                          currencyFormatter.format(shoe.price),
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        // Original Price (if discounted)
                        if (shoe.originalPrice > shoe.price)
                          Text(
                            currencyFormatter.format(shoe.originalPrice),
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(
                              color: AppTheme.secondaryText,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    // Add to Cart Button
                    if (showAddToCart && shoe.inStock)
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: ElevatedButton(
                          onPressed: () => _showAddToCartDialog(context, ref),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius8,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: AppConstants.iconSize16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddToCartDialog(BuildContext context, WidgetRef ref) {
    String selectedSize = shoe.availableSizes.first;
    String selectedColor = shoe.availableColors.first;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Select Options',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: StatefulBuilder(
              builder:
                  (context, setState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Size Selection
                      Text(
                        'Size',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppConstants.spacing8),
                      Wrap(
                        spacing: AppConstants.spacing8,
                        children:
                            shoe.availableSizes.map((size) {
                              final isSelected = size == selectedSize;
                              return GestureDetector(
                                onTap:
                                    () => setState(() => selectedSize = size),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.spacing12,
                                    vertical: AppConstants.spacing8,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? AppTheme.primaryBlack
                                            : AppTheme.primaryWhite,
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? AppTheme.primaryBlack
                                              : AppTheme.borderGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadius8,
                                    ),
                                  ),
                                  child: Text(
                                    size,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      color:
                                          isSelected
                                              ? AppTheme.primaryWhite
                                              : AppTheme.primaryBlack,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),

                      const SizedBox(height: AppConstants.spacing16),

                      // Color Selection
                      Text(
                        'Color',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppConstants.spacing8),
                      Wrap(
                        spacing: AppConstants.spacing8,
                        children:
                            shoe.availableColors.map((color) {
                              final isSelected = color == selectedColor;
                              return GestureDetector(
                                onTap:
                                    () => setState(() => selectedColor = color),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.spacing12,
                                    vertical: AppConstants.spacing8,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? AppTheme.primaryBlack
                                            : AppTheme.primaryWhite,
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? AppTheme.primaryBlack
                                              : AppTheme.borderGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadius8,
                                    ),
                                  ),
                                  child: Text(
                                    color,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      color:
                                          isSelected
                                              ? AppTheme.primaryWhite
                                              : AppTheme.primaryBlack,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .addToCart(shoe, selectedSize, selectedColor);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppConstants.addToCartSuccess),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ],
          ),
    );
  }
}
