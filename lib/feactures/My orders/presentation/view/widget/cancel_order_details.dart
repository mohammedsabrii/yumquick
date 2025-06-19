import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancel_order_actions.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_meta_data.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_title_and_price.dart';

class CancelOrderDetails extends StatelessWidget {
  const CancelOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        OrderTitleAndPrice(),
        OrderMetaData(),
        CancelOrderActions(),
        SizedBox(height: 5),
      ],
    );
  }
}
