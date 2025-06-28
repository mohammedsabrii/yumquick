import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class PaymentMethodConfirmOrderItem extends StatelessWidget {
  const PaymentMethodConfirmOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppAssets.kPaymentIcon, width: 31, height: 21),
            const SizedBox(width: 9),
            Text(
              'Credit Card',
              style: AppStyles.styleLeagueSpartanMediem14(
                context,
              ).copyWith(color: AppColor.kDarkRed, fontWeight: FontWeight.w300),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
              height: 20,
              decoration: BoxDecoration(
                color: AppColor.kYellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  '*** *** *** 43 /00 /000',
                  style: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
                    color: AppColor.kDarkRed,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 2, color: AppColor.kPinkishOrange),
      ],
    );
  }
}
