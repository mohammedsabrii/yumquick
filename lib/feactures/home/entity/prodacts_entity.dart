class ProductsEntity {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String category;
  final double priceAfterDiscount;

  ProductsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.priceAfterDiscount,
  });

  factory ProductsEntity.fromJson(Map<String, dynamic> json) {
    return ProductsEntity(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['subtitle'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['categories'] ?? '',
      priceAfterDiscount: (json['price_after_discount'] ?? 0).toDouble(),
    );
  }
}
