class SearchEntity {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String image;
  final double price;
  final String category;
  final double priceAfterDiscount;

  SearchEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.priceAfterDiscount,
  });
  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return SearchEntity(
      id: json['id'] ?? '',
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      description: json['subtitle'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['categories'] ?? '',
      priceAfterDiscount: (json['price_after_discount'] ?? 0).toDouble(),
    );
  }
}
