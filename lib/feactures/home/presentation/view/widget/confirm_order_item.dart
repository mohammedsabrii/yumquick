import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_date_and_time_and_remove_button.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_price_and_total_items.dart';

class ConfirmOrderItem extends StatelessWidget {
  const ConfirmOrderItem({super.key, required this.cartItem});
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(cartItem.imagePath),
            const SizedBox(width: 10),
            ConfirmOrderDateAndTimeAndRemoveButton(cartItem: cartItem),
            const Spacer(),
            ConfirmOrderPriceAndTotalItems(cartItem: cartItem),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: AppColor.kPinkishOrange),
      ],
    );
  }
}
