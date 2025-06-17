import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CompletedOrderMetaData extends StatelessWidget {
  const CompletedOrderMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '29 Nov, 01:20 pm',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontWeight: FontWeight.w300, color: AppColor.kDarkRed),
        ),
        Text(
          '2 items',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontWeight: FontWeight.w300, color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
