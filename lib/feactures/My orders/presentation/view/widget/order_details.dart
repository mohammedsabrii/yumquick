import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/custom_order_container.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_meta_data.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_status.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_title_and_price.dart';

class CompletedOrderDetails extends StatelessWidget {
  const CompletedOrderDetails({super.key, required this.ordersEntity});
  final OrdersEntity ordersEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        OrderTitleAndPrice(activeOrderEntity: ordersEntity),
        OrderMetaData(activeOrderEntity: ordersEntity),
        const OrderStatus(
          icon: AppAssets.kCompletedIcon,
          title: 'Order delivered',
        ),
        const CustomOrderContainer(
          title: 'Order Again',
          color: AppColor.kPinkishOrange,
          textColor: AppColor.kMainColor,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
