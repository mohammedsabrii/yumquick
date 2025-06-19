import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/completed_orders_item.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.087,
      ),
      child: const Column(
        children: [
          SizedBox(height: 20),
          Divider(thickness: 1, color: AppColor.kMainColor),
          CompletedOrdersItem(),
        ],
      ),
    );
  }
}
