import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class ActiveOrderEntity {
  final ProductsEntity product;
  final int quantity;
  final double totalAmount;
  final String customerName;
  final String customerAddress;
  final String paymentIntentId;

  ActiveOrderEntity({
    required this.product,
    required this.quantity,
    required this.totalAmount,
    required this.customerName,
    required this.customerAddress,
    required this.paymentIntentId,
  });

  factory ActiveOrderEntity.fromJson(Map<String, dynamic> json) {
    return ActiveOrderEntity(
      product: ProductsEntity.fromJson(json['products']),
      quantity: json['quantity'] ?? 1,
      totalAmount: json['total_amount'] ?? 00,
      customerAddress: json['customer_address'] ?? '',
      customerName: json['customer_name'] ?? '',
      paymentIntentId: json['payment_intent_id'] ?? '',
    );
  }
}
