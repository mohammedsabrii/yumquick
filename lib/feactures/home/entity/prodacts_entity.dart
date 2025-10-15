import 'package:hive/hive.dart';

// part 'prodacts_entity.g.dart';

// @HiveType(typeId: 1)
class ProductsEntity extends HiveObject {
  // @HiveField(0)
  final String id;
  // @HiveField(1)
  final String categoryId;
  // @HiveField(2)
  final String name;
  // @HiveField(3)
  final String description;
  // @HiveField(4)
  final String image;
  // @HiveField(5)
  final double price;
  // @HiveField(6)
  final String category;
  // @HiveField(7)
  final double? priceAfterDiscount;

  ProductsEntity({
    required this.id,
    required this.categoryId,
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
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      description: json['subtitle'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['categories'] ?? '',
      priceAfterDiscount:
          json['price_after_discount'] != null
              ? (json['price_after_discount'] as num).toDouble()
              : null,
    );
  }
}
