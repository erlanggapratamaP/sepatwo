import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoe_model.freezed.dart';
part 'shoe_model.g.dart';

@freezed
class Shoe with _$Shoe {
  const factory Shoe({
    required String id,
    required String name,
    required String description,
    required double price,
    required double originalPrice,
    required String brand,
    required String category,
    required List<String> images,
    required List<String> availableSizes,
    required List<String> availableColors,
    required double rating,
    required int reviewCount,
    required bool inStock,
    required int stockQuantity,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? discount,
    List<String>? tags,
    Map<String, dynamic>? specifications,
  }) = _Shoe;

  factory Shoe.fromJson(Map<String, dynamic> json) => _$ShoeFromJson(json);
}

@freezed
class ShoeVariant with _$ShoeVariant {
  const factory ShoeVariant({
    required String shoeId,
    required String size,
    required String color,
    required int stockQuantity,
    required double additionalPrice,
  }) = _ShoeVariant;

  factory ShoeVariant.fromJson(Map<String, dynamic> json) =>
      _$ShoeVariantFromJson(json);
}

@freezed
class ShoeFilter with _$ShoeFilter {
  const factory ShoeFilter({
    String? category,
    String? brand,
    List<String>? sizes,
    List<String>? colors,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    String? sortBy,
    String? sortOrder,
    String? searchQuery,
  }) = _ShoeFilter;

  factory ShoeFilter.fromJson(Map<String, dynamic> json) =>
      _$ShoeFilterFromJson(json);
}
