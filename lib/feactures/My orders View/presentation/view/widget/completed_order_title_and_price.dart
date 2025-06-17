import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CompletedOrderTitleAndPrice extends StatelessWidget {
  const CompletedOrderTitleAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Bean and Vegetable Burger',
            maxLines: 3,
            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),

        Text(
          '\$20.00',
          textAlign: TextAlign.right,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
