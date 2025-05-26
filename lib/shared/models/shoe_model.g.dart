// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoeImpl _$$ShoeImplFromJson(Map<String, dynamic> json) => _$ShoeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      brand: json['brand'] as String,
      category: json['category'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      availableSizes: (json['availableSizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      availableColors: (json['availableColors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      inStock: json['inStock'] as bool,
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      discount: json['discount'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      specifications: json['specifications'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ShoeImplToJson(_$ShoeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'brand': instance.brand,
      'category': instance.category,
      'images': instance.images,
      'availableSizes': instance.availableSizes,
      'availableColors': instance.availableColors,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'inStock': instance.inStock,
      'stockQuantity': instance.stockQuantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'discount': instance.discount,
      'tags': instance.tags,
      'specifications': instance.specifications,
    };

_$ShoeVariantImpl _$$ShoeVariantImplFromJson(Map<String, dynamic> json) =>
    _$ShoeVariantImpl(
      shoeId: json['shoeId'] as String,
      size: json['size'] as String,
      color: json['color'] as String,
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      additionalPrice: (json['additionalPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$ShoeVariantImplToJson(_$ShoeVariantImpl instance) =>
    <String, dynamic>{
      'shoeId': instance.shoeId,
      'size': instance.size,
      'color': instance.color,
      'stockQuantity': instance.stockQuantity,
      'additionalPrice': instance.additionalPrice,
    };

_$ShoeFilterImpl _$$ShoeFilterImplFromJson(Map<String, dynamic> json) =>
    _$ShoeFilterImpl(
      category: json['category'] as String?,
      brand: json['brand'] as String?,
      sizes:
          (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      minRating: (json['minRating'] as num?)?.toDouble(),
      sortBy: json['sortBy'] as String?,
      sortOrder: json['sortOrder'] as String?,
      searchQuery: json['searchQuery'] as String?,
    );

Map<String, dynamic> _$$ShoeFilterImplToJson(_$ShoeFilterImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'brand': instance.brand,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'minRating': instance.minRating,
      'sortBy': instance.sortBy,
      'sortOrder': instance.sortOrder,
      'searchQuery': instance.searchQuery,
    };
