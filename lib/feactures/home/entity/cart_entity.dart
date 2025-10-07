import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class CartEntity {
  final ProductsEntity product;
  final int quantity;

  CartEntity({required this.product, required this.quantity});

  factory CartEntity.fromProduct(ProductsEntity product) {
    return CartEntity(product: product, quantity: 1);
  }

  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(
      product: ProductsEntity.fromJson(json['products']),
      quantity: json['quantity'] ?? 1,
    );
  }
}
