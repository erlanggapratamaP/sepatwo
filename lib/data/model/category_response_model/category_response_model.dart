import 'category.dart';

class CategoryResponseModel {
  String? message;
  List<Category>? data;

  CategoryResponseModel({this.message, this.data});

  @override
  String toString() {
    return 'CategoryResponseModel(message: $message, data: $data)';
  }

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  CategoryResponseModel copyWith({String? message, List<Category>? data}) {
    return CategoryResponseModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
