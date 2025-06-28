import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class PaymentDeliveryTime extends StatelessWidget {
  const PaymentDeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Time',
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        // const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Estimated Delivery',
              style: AppStyles.styleLeagueSpartanLight14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            Text(
              '25 mins',
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: AppColor.kPinkishOrange),
      ],
    );
  }
}
