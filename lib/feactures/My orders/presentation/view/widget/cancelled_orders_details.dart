import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_status.dart';

class CancelledOrdersDetails extends StatelessWidget {
  const CancelledOrdersDetails({super.key});

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
        SizedBox(height: 5),
      ],
    );
  }
}
