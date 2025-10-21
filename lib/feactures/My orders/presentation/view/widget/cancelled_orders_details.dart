import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancelled_order_meta_data.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancelled_order_title_and_price.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_status.dart';

class CancelledOrdersDetails extends StatelessWidget {
  const CancelledOrdersDetails({super.key, required this.ordersEntity});
  final OrdersEntity ordersEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        CancelledOrderTitleAndPrice(orderEntity: ordersEntity),
        CancelledOrderMetaData(orderEntity: ordersEntity),
        const OrderStatus(
          icon: AppAssets.kCancelledOrderIcon,
          title: 'Order cancelled',
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
