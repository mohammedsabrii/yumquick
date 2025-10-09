import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/completed_order_actions.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_status.dart';

class CompletedOrderDetails extends StatelessWidget {
  const CompletedOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        // OrderTitleAndPrice(),
        // OrderMetaData(),
        OrderStatus(icon: AppAssets.kCompletedIcon, title: 'Order delivered'),
        CompletedOrderActions(),
        SizedBox(height: 5),
      ],
    );
  }
}
