// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Shoe _$ShoeFromJson(Map<String, dynamic> json) {
  return _Shoe.fromJson(json);
}

/// @nodoc
mixin _$Shoe {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get originalPrice => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get availableSizes => throw _privateConstructorUsedError;
  List<String> get availableColors => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  bool get inStock => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get discount => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get specifications =>
      throw _privateConstructorUsedError;

  /// Serializes this Shoe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoeCopyWith<Shoe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoeCopyWith<$Res> {
  factory $ShoeCopyWith(Shoe value, $Res Function(Shoe) then) =
      _$ShoeCopyWithImpl<$Res, Shoe>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      double originalPrice,
      String brand,
      String category,
      List<String> images,
      List<String> availableSizes,
      List<String> availableColors,
      double rating,
      int reviewCount,
      bool inStock,
      int stockQuantity,
      DateTime createdAt,
      DateTime updatedAt,
      String? discount,
      List<String>? tags,
      Map<String, dynamic>? specifications});
}

/// @nodoc
class _$ShoeCopyWithImpl<$Res, $Val extends Shoe>
    implements $ShoeCopyWith<$Res> {
  _$ShoeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? originalPrice = null,
    Object? brand = null,
    Object? category = null,
    Object? images = null,
    Object? availableSizes = null,
    Object? availableColors = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? inStock = null,
    Object? stockQuantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? discount = freezed,
    Object? tags = freezed,
    Object? specifications = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableSizes: null == availableSizes
          ? _value.availableSizes
          : availableSizes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableColors: null == availableColors
          ? _value.availableColors
          : availableColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoeImplCopyWith<$Res> implements $ShoeCopyWith<$Res> {
  factory _$$ShoeImplCopyWith(
          _$ShoeImpl value, $Res Function(_$ShoeImpl) then) =
      __$$ShoeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      double originalPrice,
      String brand,
      String category,
      List<String> images,
      List<String> availableSizes,
      List<String> availableColors,
      double rating,
      int reviewCount,
      bool inStock,
      int stockQuantity,
      DateTime createdAt,
      DateTime updatedAt,
      String? discount,
      List<String>? tags,
      Map<String, dynamic>? specifications});
}

/// @nodoc
class __$$ShoeImplCopyWithImpl<$Res>
    extends _$ShoeCopyWithImpl<$Res, _$ShoeImpl>
    implements _$$ShoeImplCopyWith<$Res> {
  __$$ShoeImplCopyWithImpl(_$ShoeImpl _value, $Res Function(_$ShoeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? originalPrice = null,
    Object? brand = null,
    Object? category = null,
    Object? images = null,
    Object? availableSizes = null,
    Object? availableColors = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? inStock = null,
    Object? stockQuantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? discount = freezed,
    Object? tags = freezed,
    Object? specifications = freezed,
  }) {
    return _then(_$ShoeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableSizes: null == availableSizes
          ? _value._availableSizes
          : availableSizes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableColors: null == availableColors
          ? _value._availableColors
          : availableColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      specifications: freezed == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoeImpl implements _Shoe {
  const _$ShoeImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.originalPrice,
      required this.brand,
      required this.category,
      required final List<String> images,
      required final List<String> availableSizes,
      required final List<String> availableColors,
      required this.rating,
      required this.reviewCount,
      required this.inStock,
      required this.stockQuantity,
      required this.createdAt,
      required this.updatedAt,
      this.discount,
      final List<String>? tags,
      final Map<String, dynamic>? specifications})
      : _images = images,
        _availableSizes = availableSizes,
        _availableColors = availableColors,
        _tags = tags,
        _specifications = specifications;

  factory _$ShoeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final double originalPrice;
  @override
  final String brand;
  @override
  final String category;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _availableSizes;
  @override
  List<String> get availableSizes {
    if (_availableSizes is EqualUnmodifiableListView) return _availableSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableSizes);
  }

  final List<String> _availableColors;
  @override
  List<String> get availableColors {
    if (_availableColors is EqualUnmodifiableListView) return _availableColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableColors);
  }

  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final bool inStock;
  @override
  final int stockQuantity;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? discount;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _specifications;
  @override
  Map<String, dynamic>? get specifications {
    final value = _specifications;
    if (value == null) return null;
    if (_specifications is EqualUnmodifiableMapView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Shoe(id: $id, name: $name, description: $description, price: $price, originalPrice: $originalPrice, brand: $brand, category: $category, images: $images, availableSizes: $availableSizes, availableColors: $availableColors, rating: $rating, reviewCount: $reviewCount, inStock: $inStock, stockQuantity: $stockQuantity, createdAt: $createdAt, updatedAt: $updatedAt, discount: $discount, tags: $tags, specifications: $specifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._availableSizes, _availableSizes) &&
            const DeepCollectionEquality()
                .equals(other._availableColors, _availableColors) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        price,
        originalPrice,
        brand,
        category,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_availableSizes),
        const DeepCollectionEquality().hash(_availableColors),
        rating,
        reviewCount,
        inStock,
        stockQuantity,
        createdAt,
        updatedAt,
        discount,
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_specifications)
      ]);

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoeImplCopyWith<_$ShoeImpl> get copyWith =>
      __$$ShoeImplCopyWithImpl<_$ShoeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoeImplToJson(
      this,
    );
  }
}

abstract class _Shoe implements Shoe {
  const factory _Shoe(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final double originalPrice,
      required final String brand,
      required final String category,
      required final List<String> images,
      required final List<String> availableSizes,
      required final List<String> availableColors,
      required final double rating,
      required final int reviewCount,
      required final bool inStock,
      required final int stockQuantity,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? discount,
      final List<String>? tags,
      final Map<String, dynamic>? specifications}) = _$ShoeImpl;

  factory _Shoe.fromJson(Map<String, dynamic> json) = _$ShoeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  double get originalPrice;
  @override
  String get brand;
  @override
  String get category;
  @override
  List<String> get images;
  @override
  List<String> get availableSizes;
  @override
  List<String> get availableColors;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  bool get inStock;
  @override
  int get stockQuantity;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get discount;
  @override
  List<String>? get tags;
  @override
  Map<String, dynamic>? get specifications;

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoeImplCopyWith<_$ShoeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoeVariant _$ShoeVariantFromJson(Map<String, dynamic> json) {
  return _ShoeVariant.fromJson(json);
}

/// @nodoc
mixin _$ShoeVariant {
  String get shoeId => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  double get additionalPrice => throw _privateConstructorUsedError;

  /// Serializes this ShoeVariant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoeVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoeVariantCopyWith<ShoeVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoeVariantCopyWith<$Res> {
  factory $ShoeVariantCopyWith(
          ShoeVariant value, $Res Function(ShoeVariant) then) =
      _$ShoeVariantCopyWithImpl<$Res, ShoeVariant>;
  @useResult
  $Res call(
      {String shoeId,
      String size,
      String color,
      int stockQuantity,
      double additionalPrice});
}

/// @nodoc
class _$ShoeVariantCopyWithImpl<$Res, $Val extends ShoeVariant>
    implements $ShoeVariantCopyWith<$Res> {
  _$ShoeVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoeVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoeId = null,
    Object? size = null,
    Object? color = null,
    Object? stockQuantity = null,
    Object? additionalPrice = null,
  }) {
    return _then(_value.copyWith(
      shoeId: null == shoeId
          ? _value.shoeId
          : shoeId // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoeVariantImplCopyWith<$Res>
    implements $ShoeVariantCopyWith<$Res> {
  factory _$$ShoeVariantImplCopyWith(
          _$ShoeVariantImpl value, $Res Function(_$ShoeVariantImpl) then) =
      __$$ShoeVariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shoeId,
      String size,
      String color,
      int stockQuantity,
      double additionalPrice});
}

/// @nodoc
class __$$ShoeVariantImplCopyWithImpl<$Res>
    extends _$ShoeVariantCopyWithImpl<$Res, _$ShoeVariantImpl>
    implements _$$ShoeVariantImplCopyWith<$Res> {
  __$$ShoeVariantImplCopyWithImpl(
      _$ShoeVariantImpl _value, $Res Function(_$ShoeVariantImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoeVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoeId = null,
    Object? size = null,
    Object? color = null,
    Object? stockQuantity = null,
    Object? additionalPrice = null,
  }) {
    return _then(_$ShoeVariantImpl(
      shoeId: null == shoeId
          ? _value.shoeId
          : shoeId // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      additionalPrice: null == additionalPrice
          ? _value.additionalPrice
          : additionalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoeVariantImpl implements _ShoeVariant {
  const _$ShoeVariantImpl(
      {required this.shoeId,
      required this.size,
      required this.color,
      required this.stockQuantity,
      required this.additionalPrice});

  factory _$ShoeVariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoeVariantImplFromJson(json);

  @override
  final String shoeId;
  @override
  final String size;
  @override
  final String color;
  @override
  final int stockQuantity;
  @override
  final double additionalPrice;

  @override
  String toString() {
    return 'ShoeVariant(shoeId: $shoeId, size: $size, color: $color, stockQuantity: $stockQuantity, additionalPrice: $additionalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoeVariantImpl &&
            (identical(other.shoeId, shoeId) || other.shoeId == shoeId) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.additionalPrice, additionalPrice) ||
                other.additionalPrice == additionalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, shoeId, size, color, stockQuantity, additionalPrice);

  /// Create a copy of ShoeVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoeVariantImplCopyWith<_$ShoeVariantImpl> get copyWith =>
      __$$ShoeVariantImplCopyWithImpl<_$ShoeVariantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoeVariantImplToJson(
      this,
    );
  }
}

abstract class _ShoeVariant implements ShoeVariant {
  const factory _ShoeVariant(
      {required final String shoeId,
      required final String size,
      required final String color,
      required final int stockQuantity,
      required final double additionalPrice}) = _$ShoeVariantImpl;

  factory _ShoeVariant.fromJson(Map<String, dynamic> json) =
      _$ShoeVariantImpl.fromJson;

  @override
  String get shoeId;
  @override
  String get size;
  @override
  String get color;
  @override
  int get stockQuantity;
  @override
  double get additionalPrice;

  /// Create a copy of ShoeVariant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoeVariantImplCopyWith<_$ShoeVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoeFilter _$ShoeFilterFromJson(Map<String, dynamic> json) {
  return _ShoeFilter.fromJson(json);
}

/// @nodoc
mixin _$ShoeFilter {
  String? get category => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  List<String>? get sizes => throw _privateConstructorUsedError;
  List<String>? get colors => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  double? get minRating => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  String? get sortOrder => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  /// Serializes this ShoeFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoeFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoeFilterCopyWith<ShoeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoeFilterCopyWith<$Res> {
  factory $ShoeFilterCopyWith(
          ShoeFilter value, $Res Function(ShoeFilter) then) =
      _$ShoeFilterCopyWithImpl<$Res, ShoeFilter>;
  @useResult
  $Res call(
      {String? category,
      String? brand,
      List<String>? sizes,
      List<String>? colors,
      double? minPrice,
      double? maxPrice,
      double? minRating,
      String? sortBy,
      String? sortOrder,
      String? searchQuery});
}

/// @nodoc
class _$ShoeFilterCopyWithImpl<$Res, $Val extends ShoeFilter>
    implements $ShoeFilterCopyWith<$Res> {
  _$ShoeFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoeFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? brand = freezed,
    Object? sizes = freezed,
    Object? colors = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? minRating = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      sizes: freezed == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoeFilterImplCopyWith<$Res>
    implements $ShoeFilterCopyWith<$Res> {
  factory _$$ShoeFilterImplCopyWith(
          _$ShoeFilterImpl value, $Res Function(_$ShoeFilterImpl) then) =
      __$$ShoeFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? category,
      String? brand,
      List<String>? sizes,
      List<String>? colors,
      double? minPrice,
      double? maxPrice,
      double? minRating,
      String? sortBy,
      String? sortOrder,
      String? searchQuery});
}

/// @nodoc
class __$$ShoeFilterImplCopyWithImpl<$Res>
    extends _$ShoeFilterCopyWithImpl<$Res, _$ShoeFilterImpl>
    implements _$$ShoeFilterImplCopyWith<$Res> {
  __$$ShoeFilterImplCopyWithImpl(
      _$ShoeFilterImpl _value, $Res Function(_$ShoeFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoeFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? brand = freezed,
    Object? sizes = freezed,
    Object? colors = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? minRating = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$ShoeFilterImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      sizes: freezed == sizes
          ? _value._sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      colors: freezed == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoeFilterImpl implements _ShoeFilter {
  const _$ShoeFilterImpl(
      {this.category,
      this.brand,
      final List<String>? sizes,
      final List<String>? colors,
      this.minPrice,
      this.maxPrice,
      this.minRating,
      this.sortBy,
      this.sortOrder,
      this.searchQuery})
      : _sizes = sizes,
        _colors = colors;

  factory _$ShoeFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoeFilterImplFromJson(json);

  @override
  final String? category;
  @override
  final String? brand;
  final List<String>? _sizes;
  @override
  List<String>? get sizes {
    final value = _sizes;
    if (value == null) return null;
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _colors;
  @override
  List<String>? get colors {
    final value = _colors;
    if (value == null) return null;
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  @override
  final double? minRating;
  @override
  final String? sortBy;
  @override
  final String? sortOrder;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'ShoeFilter(category: $category, brand: $brand, sizes: $sizes, colors: $colors, minPrice: $minPrice, maxPrice: $maxPrice, minRating: $minRating, sortBy: $sortBy, sortOrder: $sortOrder, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoeFilterImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      brand,
      const DeepCollectionEquality().hash(_sizes),
      const DeepCollectionEquality().hash(_colors),
      minPrice,
      maxPrice,
      minRating,
      sortBy,
      sortOrder,
      searchQuery);

  /// Create a copy of ShoeFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoeFilterImplCopyWith<_$ShoeFilterImpl> get copyWith =>
      __$$ShoeFilterImplCopyWithImpl<_$ShoeFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoeFilterImplToJson(
      this,
    );
  }
}

abstract class _ShoeFilter implements ShoeFilter {
  const factory _ShoeFilter(
      {final String? category,
      final String? brand,
      final List<String>? sizes,
      final List<String>? colors,
      final double? minPrice,
      final double? maxPrice,
      final double? minRating,
      final String? sortBy,
      final String? sortOrder,
      final String? searchQuery}) = _$ShoeFilterImpl;

  factory _ShoeFilter.fromJson(Map<String, dynamic> json) =
      _$ShoeFilterImpl.fromJson;

  @override
  String? get category;
  @override
  String? get brand;
  @override
  List<String>? get sizes;
  @override
  List<String>? get colors;
  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  double? get minRating;
  @override
  String? get sortBy;
  @override
  String? get sortOrder;
  @override
  String? get searchQuery;

  /// Create a copy of ShoeFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoeFilterImplCopyWith<_$ShoeFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
