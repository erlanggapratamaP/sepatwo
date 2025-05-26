import 'package:freezed_annotation/freezed_annotation.dart';
import 'shoe_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required Shoe shoe,
    required String selectedSize,
    required String selectedColor,
    required int quantity,
    required DateTime addedAt,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String userId,
    required List<CartItem> items,
    required DateTime updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

// Extensions for Cart calculations
extension CartCalculations on Cart {
  double get subtotal {
    return items.fold(
      0.0,
      (sum, item) => sum + (item.shoe.price * item.quantity),
    );
  }

  double get totalDiscount {
    return items.fold(0.0, (sum, item) {
      final discount =
          (item.shoe.originalPrice - item.shoe.price) * item.quantity;
      return sum + discount;
    });
  }

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  double get total {
    return subtotal; // Can add shipping, tax, etc. later
  }

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
}
