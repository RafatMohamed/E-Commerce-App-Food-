import 'package:food_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final num price;
  final String description;
  final String code;
  final bool isFeatured;
  final num quantity;
  final String? imagePath;
  final bool isOriginal;
  final int shelf_life;
  final num rate;
  final num ratingCount;
  final num calories;
  final num weight_grams_per_unit;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.isFeatured,
    required this.quantity,
    this.imagePath,
    this.isOriginal = true,
    required this.shelf_life,
    this.rate = 0,
    this.ratingCount = 0,
    required this.calories,
    required this.weight_grams_per_unit,
    required this.reviews,
  });
}

class ProductModelInitial {
  final String name;
  final num price;
  final String description;
  final String code;
  final bool isFeatured;
  final num quantity;
  final String? imagePath;
  final bool isOriginal;
  final int shelf_life;
  final num rate;
  final num ratingCount;
  final num calories;
  final num weight_grams_per_unit;
  final List<ReviewModel> reviews;

  ProductModelInitial({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.isFeatured,
    required this.quantity,
    this.imagePath,
    this.isOriginal = true,
    required this.shelf_life,
    this.rate = 0,
    this.ratingCount = 0,
    required this.calories,
    required this.weight_grams_per_unit,
    required this.reviews,
  });

  /// ✅ Factory: From Firebase JSON
  factory ProductModelInitial.fromJson(Map<String, dynamic> json) {
    return ProductModelInitial(
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      code: json['code'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
      quantity: json['quantity'] ?? 0,
      imagePath: json['imagePath'],
      isOriginal: json['isOriginal'] ?? true,
      shelf_life: json['shelf_life'] ?? 0,
      rate: json['rate'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
      calories: json['calories'] ?? 0,
      weight_grams_per_unit: json['weight_grams_per_unit'] ?? 0,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((reviewJson) => ReviewModel.fromJson(reviewJson))
          .toList(),
    );
  }

  /// 🔁 Converts to your working model
  ProductModel toEntity() {
    return ProductModel(
      name: name,
      price: price,
      description: description,
      code: code,
      isFeatured: isFeatured,
      quantity: quantity,
      imagePath: imagePath,
      isOriginal: isOriginal,
      shelf_life: shelf_life,
      rate: rate,
      ratingCount: ratingCount,
      calories: calories,
      weight_grams_per_unit: weight_grams_per_unit,
      reviews: reviews,
    );
  }

  /// 📤 Send to Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code,
      'isFeatured': isFeatured,
      'quantity': quantity,
      'imagePath': imagePath,
      'isOriginal': isOriginal,
      'shelf_life': shelf_life,
      'rate': rate,
      'ratingCount': ratingCount,
      'calories': calories,
      'weight_grams_per_unit': weight_grams_per_unit,
      'reviews': reviews.map((r) => r.toJson()).toList(),
    };
  }
}

