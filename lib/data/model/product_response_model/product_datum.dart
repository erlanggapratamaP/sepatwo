class ProductDatum {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? image;
  int? price;
  int? stock;
  int? isAvailable;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageUrl;

  ProductDatum({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.image,
    this.price,
    this.stock,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  @override
  String toString() {
    return 'Datum(id: $id, categoryId: $categoryId, name: $name, description: $description, image: $image, price: $price, stock: $stock, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl)';
  }

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    id: json['id'] as int?,
    categoryId: json['category_id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    price: json['price'] as int?,
    stock: json['stock'] as int?,
    isAvailable: json['is_available'] as int?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    imageUrl: json['image_url'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category_id': categoryId,
    'name': name,
    'description': description,
    'image': image,
    'price': price,
    'stock': stock,
    'is_available': isAvailable,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  ProductDatum copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? description,
    String? image,
    int? price,
    int? stock,
    int? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductDatum(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
