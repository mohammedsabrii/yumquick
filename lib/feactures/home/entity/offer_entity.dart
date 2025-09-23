class OffersEntity {
  final String id;
  final String name;
  final String offerName;

  final String description;
  final String image;
  final double price;
  final String category;
  final double priceAfterDiscount;

  OffersEntity({
    required this.id,
    required this.name,
    required this.offerName,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.priceAfterDiscount,
  });

  factory OffersEntity.fromJson(Map<String, dynamic> json) {
    return OffersEntity(
      id: json['id'] ?? '',
      name: json['product_name'] ?? '',
      offerName: json['offer_name'] ?? '',
      description: json['subtitle'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['category'] ?? '',
      priceAfterDiscount: (json['price_after_discount'] ?? 0).toDouble(),
    );
  }
}
