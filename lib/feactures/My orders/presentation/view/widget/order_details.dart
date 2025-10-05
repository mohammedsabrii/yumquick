import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/completed_order_actions.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_meta_data.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_status.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_title_and_price.dart';

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
        OrderStatus(),
        CompletedOrderActions(),
        SizedBox(height: 5),
      ],
    );
  }
}
