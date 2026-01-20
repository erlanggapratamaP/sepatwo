import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import 'providers/product_provider.dart';
import '../cart/providers/cart_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int _currentImageIndex = 0;
  String? _selectedSize;
  String? _selectedColor;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(shoeByIdProvider(widget.productId));

    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          onPressed: () {
            final router = GoRouter.of(context);
            if (router.canPop()) {
              router.pop();
            } else {
              router.go('/');
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
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
                    onPressed:
                        () => ref.refresh(shoeByIdProvider(widget.productId)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
        data: (product) {
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }

          // Initialize selected size and color if not set
          _selectedSize ??=
              product.availableSizes.isNotEmpty
                  ? product.availableSizes.first
                  : null;
          _selectedColor ??=
              product.availableColors.isNotEmpty
                  ? product.availableColors.first
                  : null;

          return CustomScrollView(
            slivers: [
              // Image Carousel
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 400,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemCount: product.images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: AppTheme.primaryWhite,
                            child: Image.network(
                              product.images[index],
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 100,
                                      color: AppTheme.secondaryText,
                                    ),
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Image indicators
                    if (product.images.length > 1)
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            product.images.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _currentImageIndex == index
                                        ? AppTheme.primaryBlack
                                        : AppTheme.secondaryText.withOpacity(
                                          0.3,
                                        ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    // Discount badge
                    if (product.discount != null)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryBlack,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.discount!,
                            style: Theme.of(
                              context,
                            ).textTheme.labelSmall!.copyWith(
                              color: AppTheme.primaryWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Product Info
              SliverToBoxAdapter(
                child: Container(
                  color: AppTheme.primaryWhite,
                  padding: const EdgeInsets.all(AppConstants.spacing16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Brand
                      Text(
                        product.brand,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppTheme.secondaryText,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: AppConstants.spacing8),

                      // Product Name
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: AppConstants.spacing12),

                      // Rating and Reviews
                      Row(
                        children: [
                          const Icon(Icons.star, size: 20, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            product.rating.toString(),
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(${product.reviewCount} reviews)',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppTheme.secondaryText),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.spacing16),

                      // Price
                      Row(
                        children: [
                          Text(
                            'Rp ${product.price.toStringAsFixed(0)}',
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (product.originalPrice > product.price) ...[
                            const SizedBox(width: 12),
                            Text(
                              'Rp ${product.originalPrice.toStringAsFixed(0)}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppTheme.secondaryText,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: AppConstants.spacing8),

                      // Stock Status
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color:
                              product.inStock
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.inStock
                              ? 'In Stock (${product.stockQuantity} available)'
                              : 'Out of Stock',
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            color:
                                product.inStock
                                    ? Colors.green.shade700
                                    : Colors.red.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Size Selection
              if (product.availableSizes.isNotEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    color: AppTheme.primaryWhite,
                    padding: const EdgeInsets.fromLTRB(
                      AppConstants.spacing16,
                      0,
                      AppConstants.spacing16,
                      AppConstants.spacing16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Size',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: AppConstants.spacing12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              product.availableSizes.map((size) {
                                final isSelected = _selectedSize == size;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = size;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? AppTheme.primaryBlack
                                              : AppTheme.backgroundGrey,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? AppTheme.primaryBlack
                                                : AppTheme.secondaryText
                                                    .withOpacity(0.2),
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
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

              // Color Selection
              if (product.availableColors.isNotEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    color: AppTheme.primaryWhite,
                    padding: const EdgeInsets.fromLTRB(
                      AppConstants.spacing16,
                      0,
                      AppConstants.spacing16,
                      AppConstants.spacing16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Color',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: AppConstants.spacing12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              product.availableColors.map((color) {
                                final isSelected = _selectedColor == color;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedColor = color;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? AppTheme.primaryBlack
                                              : AppTheme.backgroundGrey,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? AppTheme.primaryBlack
                                                : AppTheme.secondaryText
                                                    .withOpacity(0.2),
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
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

              const SliverToBoxAdapter(
                child: SizedBox(height: AppConstants.spacing16),
              ),

              // Description
              SliverToBoxAdapter(
                child: Container(
                  color: AppTheme.primaryWhite,
                  padding: const EdgeInsets.all(AppConstants.spacing16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: AppConstants.spacing12),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppTheme.secondaryText,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Category and Tags
              SliverToBoxAdapter(
                child: Container(
                  color: AppTheme.primaryWhite,
                  margin: const EdgeInsets.only(top: AppConstants.spacing16),
                  padding: const EdgeInsets.all(AppConstants.spacing16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Category: ',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            product.category,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppTheme.secondaryText),
                          ),
                        ],
                      ),
                      if (product.tags != null && product.tags!.isNotEmpty) ...[
                        const SizedBox(height: AppConstants.spacing12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              product.tags!.map((tag) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.backgroundGrey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    '#$tag',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelSmall!.copyWith(
                                      color: AppTheme.secondaryText,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Bottom spacing for the button
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
        },
      ),
      // Add to Cart Button
      bottomNavigationBar: productAsync.when(
        loading: () => null,
        error: (_, __) => null,
        data: (product) {
          if (product == null || !product.inStock) return null;

          return Container(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            decoration: BoxDecoration(
              color: AppTheme.primaryWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedSize == null || _selectedColor == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select size and color'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  ref
                      .read(cartProvider.notifier)
                      .addToCart(product, _selectedSize!, _selectedColor!);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Added to cart'),
                      action: SnackBarAction(
                        label: 'View Cart',
                        onPressed: () => context.go('/cart'),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlack,
                  foregroundColor: AppTheme.primaryWhite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadius12,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_bag_outlined),
                    const SizedBox(width: 8),
                    Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.primaryWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
