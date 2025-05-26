import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../shared/models/cart_model.dart';
import '../../../shared/models/shoe_model.dart';

// Provider for cart
final cartProvider = StateNotifierProvider<CartNotifier, Cart>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier()
    : super(
        Cart(
          userId: 'current_user', // This would come from auth
          items: [],
          updatedAt: DateTime.now(),
        ),
      );

  void addToCart(
    Shoe shoe,
    String selectedSize,
    String selectedColor, {
    int quantity = 1,
  }) {
    final existingItemIndex = state.items.indexWhere(
      (item) =>
          item.shoe.id == shoe.id &&
          item.selectedSize == selectedSize &&
          item.selectedColor == selectedColor,
    );

    if (existingItemIndex != -1) {
      // Update quantity of existing item
      final updatedItems = [...state.items];
      updatedItems[existingItemIndex] = updatedItems[existingItemIndex]
          .copyWith(
            quantity: updatedItems[existingItemIndex].quantity + quantity,
          );

      state = state.copyWith(items: updatedItems, updatedAt: DateTime.now());
    } else {
      // Add new item
      final newItem = CartItem(
        id: const Uuid().v4(),
        shoe: shoe,
        selectedSize: selectedSize,
        selectedColor: selectedColor,
        quantity: quantity,
        addedAt: DateTime.now(),
      );

      state = state.copyWith(
        items: [...state.items, newItem],
        updatedAt: DateTime.now(),
      );
    }
  }

  void removeFromCart(String itemId) {
    state = state.copyWith(
      items: state.items.where((item) => item.id != itemId).toList(),
      updatedAt: DateTime.now(),
    );
  }

  void updateQuantity(String itemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(itemId);
      return;
    }

    final updatedItems =
        state.items.map((item) {
          if (item.id == itemId) {
            return item.copyWith(quantity: newQuantity);
          }
          return item;
        }).toList();

    state = state.copyWith(items: updatedItems, updatedAt: DateTime.now());
  }

  void clearCart() {
    state = state.copyWith(items: [], updatedAt: DateTime.now());
  }

  void removeShoeFromCart(String shoeId) {
    state = state.copyWith(
      items: state.items.where((item) => item.shoe.id != shoeId).toList(),
      updatedAt: DateTime.now(),
    );
  }

  bool isInCart(String shoeId, String size, String color) {
    return state.items.any(
      (item) =>
          item.shoe.id == shoeId &&
          item.selectedSize == size &&
          item.selectedColor == color,
    );
  }

  CartItem? getCartItem(String shoeId, String size, String color) {
    try {
      return state.items.firstWhere(
        (item) =>
            item.shoe.id == shoeId &&
            item.selectedSize == size &&
            item.selectedColor == color,
      );
    } catch (e) {
      return null;
    }
  }
}

// Provider for cart item count
final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.totalItems;
});

// Provider for cart total
final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.total;
});

// Provider for cart subtotal
final cartSubtotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.subtotal;
});

// Provider for cart total discount
final cartTotalDiscountProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.totalDiscount;
});

// Provider to check if a specific shoe is in cart
final isInCartProvider = Provider.family<bool, Map<String, String>>((
  ref,
  params,
) {
  final cart = ref.watch(cartProvider);
  final shoeId = params['shoeId']!;
  final size = params['size']!;
  final color = params['color']!;

  return cart.items.any(
    (item) =>
        item.shoe.id == shoeId &&
        item.selectedSize == size &&
        item.selectedColor == color,
  );
});

// Provider for cart item by shoe details
final cartItemProvider = Provider.family<CartItem?, Map<String, String>>((
  ref,
  params,
) {
  final cart = ref.watch(cartProvider);
  final shoeId = params['shoeId']!;
  final size = params['size']!;
  final color = params['color']!;

  try {
    return cart.items.firstWhere(
      (item) =>
          item.shoe.id == shoeId &&
          item.selectedSize == size &&
          item.selectedColor == color,
    );
  } catch (e) {
    return null;
  }
});
