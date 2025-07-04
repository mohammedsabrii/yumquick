import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/core/widget/custom_total_item.dart';

class CartDateAndTimeAndTotalItem extends StatelessWidget {
  final CartItem cartItem;

  const CartDateAndTimeAndTotalItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          cartItem.date,
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontSize: 13, color: AppColor.kCultured),
        ),
        Text(
          cartItem.time,
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontSize: 13, color: AppColor.kCultured),
        ),
        CustomTotalItem(cartItem: cartItem),
      ],
    );
  }
}
