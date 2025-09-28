import 'package:hive/hive.dart';

part 'offer_entity.g.dart';

@HiveType(typeId: 0)
class OffersEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String offerName;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final double price;
  @HiveField(6)
  final String category;
  @HiveField(7)
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
