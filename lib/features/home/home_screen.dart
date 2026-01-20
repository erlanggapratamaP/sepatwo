import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../product/providers/product_provider.dart';
import '../cart/providers/cart_provider.dart';
import '../product/widgets/product_card.dart';
import '../product/providers/category_provider.dart';
import '../../data/model/category_response_model/category.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredShoesAsync = ref.watch(featuredShoesProvider);
    final allShoesAsync = ref.watch(shoesProvider);
    final cartItemCount = ref.watch(cartItemCountProvider);
    final categoryState = ref.watch(categoryProvider);

    // Load categories on first build
    ref.listen(categoryProvider, (previous, next) {
      if (previous is CategoryInitial && next is CategoryInitial) {
        ref.read(categoryProvider.notifier).getCategories();
      }
    });

    // Trigger loading categories
    if (categoryState is CategoryInitial) {
      Future.microtask(() {
        ref.read(categoryProvider.notifier).getCategories();
      });
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.primaryWhite,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              centerTitle: false,
              titlePadding: const EdgeInsets.only(
                left: AppConstants.spacing16,
                bottom: AppConstants.spacing16,
              ),
            ),
            actions: [
              // Search Icon
              IconButton(
                onPressed: () => context.go('/search'),
                icon: const Icon(Icons.search),
              ),
              // Cart Icon with Badge
              Stack(
                children: [
                  IconButton(
                    onPressed: () => context.go('/cart'),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  if (cartItemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlack,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          cartItemCount > 99 ? '99+' : '$cartItemCount',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(
                            color: AppTheme.primaryWhite,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: AppConstants.spacing8),
            ],
          ),

          // Welcome Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.spacing16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Text(
                    'Premium footwear collection',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Categories Section
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing16,
                  ),
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.spacing12),
                SizedBox(
                  height: 100,
                  child: categoryState.when(
                    initial:
                        () => const Center(child: CircularProgressIndicator()),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    loaded:
                        (categories) =>
                            categories.isEmpty
                                ? Center(
                                  child: Text(
                                    'No categories available',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                )
                                : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.spacing16,
                                  ),
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    final category = categories[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: AppConstants.spacing12,
                                      ),
                                      child: _CategoryCard(category: category),
                                    );
                                  },
                                ),
                    error:
                        (message) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline, size: 32),
                              const SizedBox(height: 8),
                              Text(
                                'Failed to load categories',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.spacing24),
          ),

          // Featured Products Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to all products
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
          ),

          // Featured Products Grid
          featuredShoesAsync.when(
            loading:
                () => const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.spacing32),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            error:
                (error, stack) => SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing32),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: AppConstants.iconSize48,
                            color: AppTheme.secondaryText,
                          ),
                          const SizedBox(height: AppConstants.spacing16),
                          Text(
                            'Failed to load products',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: AppConstants.spacing8),
                          ElevatedButton(
                            onPressed: () => ref.refresh(featuredShoesProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            data:
                (shoes) =>
                    shoes.isEmpty
                        ? const SliverToBoxAdapter(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(AppConstants.spacing32),
                              child: Text('No featured products available'),
                            ),
                          ),
                        )
                        : SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacing8,
                          ),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.65,
                                  crossAxisSpacing: AppConstants.spacing8,
                                  mainAxisSpacing: AppConstants.spacing8,
                                ),
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final shoe = shoes[index];
                              return ProductCard(
                                shoe: shoe,
                                onTap: () => context.go('/product/${shoe.id}'),
                              );
                            }, childCount: shoes.length > 4 ? 4 : shoes.length),
                          ),
                        ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.spacing32),
          ),

          // All Products Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing16,
              ),
              child: Text(
                'All Products',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.spacing16),
          ),

          // All Products Grid
          allShoesAsync.when(
            loading:
                () => const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.spacing32),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            error:
                (error, stack) => SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing32),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: AppConstants.iconSize48,
                            color: AppTheme.secondaryText,
                          ),
                          const SizedBox(height: AppConstants.spacing16),
                          Text(
                            'Failed to load products',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: AppConstants.spacing8),
                          ElevatedButton(
                            onPressed: () => ref.refresh(shoesProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            data:
                (shoes) =>
                    shoes.isEmpty
                        ? const SliverToBoxAdapter(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(AppConstants.spacing32),
                              child: Text('No products available'),
                            ),
                          ),
                        )
                        : SliverPadding(
                          padding: const EdgeInsets.all(AppConstants.spacing8),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.65,
                                  crossAxisSpacing: AppConstants.spacing8,
                                  mainAxisSpacing: AppConstants.spacing8,
                                ),
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final shoe = shoes[index];
                              return ProductCard(
                                shoe: shoe,
                                onTap: () => context.go('/product/${shoe.id}'),
                              );
                            }, childCount: shoes.length),
                          ),
                        ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.spacing32),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to category products
      },
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: AppTheme.primaryWhite,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
          boxShadow: AppTheme.lightShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.backgroundGrey,
                borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
              ),
              child:
                  category.image != null && category.image!.isNotEmpty
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppConstants.borderRadius8,
                        ),
                        child: Image.network(
                          category.image!,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Icon(
                                _getCategoryIcon(category.name ?? ''),
                                size: AppConstants.iconSize24,
                                color: AppTheme.primaryBlack,
                              ),
                        ),
                      )
                      : Icon(
                        _getCategoryIcon(category.name ?? ''),
                        size: AppConstants.iconSize24,
                        color: AppTheme.primaryBlack,
                      ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              category.name ?? '',
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'sneakers':
        return Icons.sports_soccer;
      case 'formal':
        return Icons.business_center;
      case 'casual':
        return Icons.weekend;
      case 'sports':
        return Icons.fitness_center;
      case 'boots':
        return Icons.terrain;
      case 'sandals':
        return Icons.beach_access;
      case 'loafers':
        return Icons.style;
      case 'high heels':
        return Icons.female;
      default:
        return Icons.shopping_bag;
    }
  }
}
