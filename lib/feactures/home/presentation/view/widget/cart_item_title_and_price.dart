import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CartItemTitleAndPrice extends StatelessWidget {
  const CartItemTitleAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Strawberry \nShake',
          style: AppStyles.styleLeagueSpartanMediem16(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
        Text(
          '\$20.00',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: AppColor.kCultured, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
