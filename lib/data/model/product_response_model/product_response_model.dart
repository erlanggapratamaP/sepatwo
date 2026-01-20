import 'product_data.dart';

class ProductResponseModel {
  String? message;
  ProductData? data;

  ProductResponseModel({this.message, this.data});

  @override
  String toString() {
    return 'ProductResponseModel(message: $message, data: $data)';
  }

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : ProductData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};

  ProductResponseModel copyWith({String? message, ProductData? data}) {
    return ProductResponseModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
