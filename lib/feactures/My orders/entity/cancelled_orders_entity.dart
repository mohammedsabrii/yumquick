import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class CancelledOrdersEntity {
  final int quantity;
  final double totalAmount;
  final ProductsEntity product;

  CancelledOrdersEntity({
    required this.quantity,
    required this.totalAmount,
    required this.product,
  });

  factory CancelledOrdersEntity.fromJson(Map<String, dynamic> json) {
    return CancelledOrdersEntity(
      quantity: json['quantity'] ?? 0,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      product: ProductsEntity.fromJson(json['products']),
    );
  }
}
