import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_date_and_time_and_total_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_item_title_and_price.dart';

class DrawerCartItem extends StatelessWidget {
  const DrawerCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/images/drawer cart item test .png'),
            const SizedBox(width: 9),
            const CartItemTitleAndPrice(),
            const Spacer(),
            const CartDateAndTimeAndTotalItem(),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: AppColor.kCultured),
      ],
    );
  }
}
