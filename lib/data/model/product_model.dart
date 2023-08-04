class ProductModel {
  int count;
  int price;
  int isCarted;
  double? rating;
  List<dynamic> productImages;
  String categoryId;
  String productId;
  String productName;
  String description;
  String createdAt;
  String currency;

  ProductModel({
    required this.count,
    required this.price,
     this.rating,
    required this.isCarted,
    required this.productImages,
    required this.categoryId,
    required this.productId,
    required this.productName,
    required this.description,
    required this.createdAt,
    required this.currency,
  });

  ProductModel copyWith({
    int? count,
    int? price,
    int? isCarted,
    double? rating,
    List<dynamic>? productImages,
    String? categoryId,
    String? productId,
    String? productName,
    String? description,
    String? createdAt,
    String? currency,
  }) {
    return ProductModel(
      count: count ?? this.count,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      isCarted: isCarted ?? this.isCarted,
      productImages: productImages ?? this.productImages,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      currency: currency ?? this.currency,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      count: jsonData['count'] as int? ?? 0,
      price: jsonData['price'] as int? ?? 0,
      rating: jsonData['rating'] as double? ?? 0.0,
      isCarted: jsonData['isCarted'] as int? ?? 0,
      productImages: (jsonData['productImages'] as List<dynamic>? ?? []),
      categoryId: jsonData['categoryId'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      productName: jsonData['productName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
      currency: jsonData['currency'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'price': price,
      'rating': rating,
      'isCarted': isCarted,
      'productImages': productImages,
      'categoryId': categoryId,
      'productId': productId,
      'productName': productName,
      'description': description,
      'createdAt': createdAt,
      'currency': currency,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      price: $price,
      rating: $rating,
      isCarted: $isCarted,
      productImages: $productImages,
      categoryId: $categoryId,
      productId: $productId,
      productName: $productName,
      description: $description,
      createdAt: $createdAt,
      currency: $currency
      ''';
  }
}