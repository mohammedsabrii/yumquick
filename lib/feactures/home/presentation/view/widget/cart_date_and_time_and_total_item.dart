import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_total_item.dart';

class CartDateAndTimeAndTotalItem extends StatelessWidget {
  const CartDateAndTimeAndTotalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '29/11/24',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontSize: 13, color: AppColor.kCultured),
        ),
        Text(
          '15:00',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontSize: 13, color: AppColor.kCultured),
        ),
        const CartTotalItem(),
      ],
    );
  }
}
