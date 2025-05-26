import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/shoe_model.dart';

// Dummy data for development
final dummyShoes = [
  Shoe(
    id: '1',
    name: 'Classic Black Sneakers',
    description:
        'Elegant mono chrome sneakers perfect for any occasion. Crafted with premium materials for ultimate comfort and style.',
    price: 299000,
    originalPrice: 399000,
    brand: 'Nike',
    category: 'Sneakers',
    images: [
      'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=400&h=400&fit=crop',
      'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400&h=400&fit=crop',
    ],
    availableSizes: ['39', '40', '41', '42', '43', '44'],
    availableColors: ['Black', 'White', 'Grey'],
    rating: 4.5,
    reviewCount: 128,
    inStock: true,
    stockQuantity: 25,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    updatedAt: DateTime.now(),
    discount: '25% OFF',
    tags: ['trending', 'bestseller'],
  ),
  Shoe(
    id: '2',
    name: 'Minimalist White Runners',
    description:
        'Clean, minimal design meets maximum performance. These white runners are perfect for both casual wear and light workouts.',
    price: 259000,
    originalPrice: 299000,
    brand: 'Adidas',
    category: 'Sports',
    images: [
      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400&h=400&fit=crop',
      'https://images.unsplash.com/photo-1562183241-b937e95585b6?w=400&h=400&fit=crop',
    ],
    availableSizes: ['38', '39', '40', '41', '42', '43'],
    availableColors: ['White', 'Light Grey'],
    rating: 4.3,
    reviewCount: 89,
    inStock: true,
    stockQuantity: 18,
    createdAt: DateTime.now().subtract(const Duration(days: 20)),
    updatedAt: DateTime.now(),
    discount: '13% OFF',
    tags: ['new', 'sports'],
  ),
  Shoe(
    id: '3',
    name: 'Professional Black Oxfords',
    description:
        'Sophisticated formal shoes designed for the modern professional. Exceptional quality and timeless style.',
    price: 449000,
    originalPrice: 549000,
    brand: 'Clarks',
    category: 'Formal',
    images: [
      'https://images.unsplash.com/photo-1614252235316-8c857d38c0b5?w=400&h=400&fit=crop',
      'https://images.unsplash.com/photo-1596703263926-681afa739d4e?w=400&h=400&fit=crop',
    ],
    availableSizes: ['40', '41', '42', '43', '44', '45'],
    availableColors: ['Black', 'Dark Grey'],
    rating: 4.7,
    reviewCount: 203,
    inStock: true,
    stockQuantity: 12,
    createdAt: DateTime.now().subtract(const Duration(days: 45)),
    updatedAt: DateTime.now(),
    discount: '18% OFF',
    tags: ['formal', 'premium'],
  ),
  Shoe(
    id: '4',
    name: 'Casual Grey Slip-ons',
    description:
        'Comfortable slip-on shoes for everyday wear. Perfect blend of comfort and style in a sophisticated grey tone.',
    price: 199000,
    originalPrice: 229000,
    brand: 'Vans',
    category: 'Casual',
    images: [
      'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=400&h=400&fit=crop',
      'https://images.unsplash.com/photo-1560769629-975ec94e6a86?w=400&h=400&fit=crop',
    ],
    availableSizes: ['38', '39', '40', '41', '42'],
    availableColors: ['Grey', 'Light Grey', 'Dark Grey'],
    rating: 4.2,
    reviewCount: 67,
    inStock: true,
    stockQuantity: 31,
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
    updatedAt: DateTime.now(),
    discount: '13% OFF',
    tags: ['casual', 'comfort'],
  ),
];

// Provider for all shoes
final shoesProvider =
    StateNotifierProvider<ShoesNotifier, AsyncValue<List<Shoe>>>((ref) {
      return ShoesNotifier();
    });

class ShoesNotifier extends StateNotifier<AsyncValue<List<Shoe>>> {
  ShoesNotifier() : super(const AsyncValue.loading()) {
    loadShoes();
  }

  Future<void> loadShoes() async {
    try {
      state = const AsyncValue.loading();
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      state = AsyncValue.data(dummyShoes);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refreshShoes() async {
    await loadShoes();
  }
}

// Provider for filtered shoes
final filteredShoesProvider = Provider<AsyncValue<List<Shoe>>>((ref) {
  final shoesAsync = ref.watch(shoesProvider);
  final filter = ref.watch(shoeFilterProvider);

  return shoesAsync.when(
    loading: () => const AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    data: (shoes) {
      List<Shoe> filteredShoes = shoes;

      // Apply search filter
      if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
        filteredShoes =
            filteredShoes.where((shoe) {
              return shoe.name.toLowerCase().contains(
                    filter.searchQuery!.toLowerCase(),
                  ) ||
                  shoe.brand.toLowerCase().contains(
                    filter.searchQuery!.toLowerCase(),
                  ) ||
                  shoe.category.toLowerCase().contains(
                    filter.searchQuery!.toLowerCase(),
                  );
            }).toList();
      }

      // Apply category filter
      if (filter.category != null && filter.category!.isNotEmpty) {
        filteredShoes =
            filteredShoes
                .where((shoe) => shoe.category == filter.category)
                .toList();
      }

      // Apply brand filter
      if (filter.brand != null && filter.brand!.isNotEmpty) {
        filteredShoes =
            filteredShoes.where((shoe) => shoe.brand == filter.brand).toList();
      }

      // Apply price range filter
      if (filter.minPrice != null) {
        filteredShoes =
            filteredShoes
                .where((shoe) => shoe.price >= filter.minPrice!)
                .toList();
      }
      if (filter.maxPrice != null) {
        filteredShoes =
            filteredShoes
                .where((shoe) => shoe.price <= filter.maxPrice!)
                .toList();
      }

      // Apply rating filter
      if (filter.minRating != null) {
        filteredShoes =
            filteredShoes
                .where((shoe) => shoe.rating >= filter.minRating!)
                .toList();
      }

      // Apply sorting
      if (filter.sortBy != null) {
        switch (filter.sortBy) {
          case 'price':
            filteredShoes.sort((a, b) {
              return filter.sortOrder == 'desc'
                  ? b.price.compareTo(a.price)
                  : a.price.compareTo(b.price);
            });
            break;
          case 'rating':
            filteredShoes.sort((a, b) {
              return filter.sortOrder == 'desc'
                  ? b.rating.compareTo(a.rating)
                  : a.rating.compareTo(b.rating);
            });
            break;
          case 'name':
            filteredShoes.sort((a, b) {
              return filter.sortOrder == 'desc'
                  ? b.name.compareTo(a.name)
                  : a.name.compareTo(b.name);
            });
            break;
          case 'newest':
            filteredShoes.sort((a, b) {
              return filter.sortOrder == 'desc'
                  ? b.createdAt.compareTo(a.createdAt)
                  : a.createdAt.compareTo(b.createdAt);
            });
            break;
        }
      }

      return AsyncValue.data(filteredShoes);
    },
  );
});

// Provider for shoe filter
final shoeFilterProvider =
    StateNotifierProvider<ShoeFilterNotifier, ShoeFilter>((ref) {
      return ShoeFilterNotifier();
    });

class ShoeFilterNotifier extends StateNotifier<ShoeFilter> {
  ShoeFilterNotifier() : super(const ShoeFilter());

  void updateFilter(ShoeFilter newFilter) {
    state = newFilter;
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void updateCategory(String? category) {
    state = state.copyWith(category: category);
  }

  void updateBrand(String? brand) {
    state = state.copyWith(brand: brand);
  }

  void updatePriceRange(double? minPrice, double? maxPrice) {
    state = state.copyWith(minPrice: minPrice, maxPrice: maxPrice);
  }

  void updateRating(double? minRating) {
    state = state.copyWith(minRating: minRating);
  }

  void updateSort(String? sortBy, String? sortOrder) {
    state = state.copyWith(sortBy: sortBy, sortOrder: sortOrder);
  }

  void clearFilter() {
    state = const ShoeFilter();
  }
}

// Provider for single shoe by ID
final shoeByIdProvider = Provider.family<AsyncValue<Shoe?>, String>((ref, id) {
  final shoesAsync = ref.watch(shoesProvider);

  return shoesAsync.when(
    loading: () => const AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    data: (shoes) {
      try {
        final shoe = shoes.firstWhere((shoe) => shoe.id == id);
        return AsyncValue.data(shoe);
      } catch (e) {
        return const AsyncValue.data(null);
      }
    },
  );
});

// Provider for featured shoes (trending, bestseller, etc.)
final featuredShoesProvider = Provider<AsyncValue<List<Shoe>>>((ref) {
  final shoesAsync = ref.watch(shoesProvider);

  return shoesAsync.when(
    loading: () => const AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    data: (shoes) {
      final featuredShoes =
          shoes.where((shoe) {
            return shoe.tags?.contains('trending') == true ||
                shoe.tags?.contains('bestseller') == true ||
                shoe.rating >= 4.5;
          }).toList();
      return AsyncValue.data(featuredShoes);
    },
  );
});
