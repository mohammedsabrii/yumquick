import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_date_and_time_and_total_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_item_title_and_price.dart';

class DrawerCartItem extends StatelessWidget {
  final CartItem cartItem;

  const DrawerCartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(cartItem.imagePath),
            const SizedBox(width: 9),
            CartItemTitleAndPrice(cartItem: cartItem),
            const Spacer(),
            CartDateAndTimeAndTotalItem(cartItem: cartItem),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: AppColor.kCultured),
      ],
    );
  }
}
