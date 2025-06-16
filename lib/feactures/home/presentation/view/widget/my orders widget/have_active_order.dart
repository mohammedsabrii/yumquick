import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/my%20orders%20widget/have_active_order_item.dart';

class HaveActiveOrder extends StatelessWidget {
  const HaveActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.087,
      ),
      child: const Column(
        children: [
          Divider(thickness: 1, color: AppColor.kMainColor),
          HaveActiveOrderItem(),
          Divider(thickness: 1, color: AppColor.kMainColor),
        ],
      ),
    );
  }
}
