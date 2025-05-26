// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] as String,
      shoe: Shoe.fromJson(json['shoe'] as Map<String, dynamic>),
      selectedSize: json['selectedSize'] as String,
      selectedColor: json['selectedColor'] as String,
      quantity: (json['quantity'] as num).toInt(),
      addedAt: DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shoe': instance.shoe,
      'selectedSize': instance.selectedSize,
      'selectedColor': instance.selectedColor,
      'quantity': instance.quantity,
      'addedAt': instance.addedAt.toIso8601String(),
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      userId: json['userId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'items': instance.items,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
