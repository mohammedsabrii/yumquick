import 'package:yumquick/feactures/My%20orders/entity/active_order_entity.dart';

class CancelledOrdersEntity {
  final ActiveOrderEntity product;
  CancelledOrdersEntity({required this.product});
  factory CancelledOrdersEntity.fromJson(Map<String, dynamic> json) {
    return CancelledOrdersEntity(
      product: ActiveOrderEntity.fromJson(json['active_order']),
    );
  }
}
