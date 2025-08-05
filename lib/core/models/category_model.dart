class CategoryModel {
  final String name;
  final String imgUrl;

  CategoryModel({
    required this.name,
    required this.imgUrl,
  });
}

class CategoryModelInitial {
  final String name;
  final String imgUrl;

  CategoryModelInitial({
    required this.name,
    required this.imgUrl
  });

  factory CategoryModelInitial.fromJson(Map<String, dynamic> json) {
    return CategoryModelInitial(
      name: json['name'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
    );
  }

  /// 🔁 Converts to your working model
  CategoryModel toEntity() {
    return CategoryModel(
      name: name,
      imgUrl: imgUrl,
    );
  }

  /// 📤 Send to Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imgUrl': imgUrl,
    };
  }
}

