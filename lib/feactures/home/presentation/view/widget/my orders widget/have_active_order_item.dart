import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/my%20orders%20widget/custom_order_container.dart';

class HaveActiveOrderItem extends StatelessWidget {
  const HaveActiveOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.korderTestImage),

        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Strawberry shake',
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '29 Nov, 01:20 pm ',
                textAlign: TextAlign.start,
                style: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColor.kDarkRed,
                ),
              ),
            ),
            const CustomOrderContainer(
              title: 'Cancel Order',
              color: AppColor.kMainColor,
              textColor: AppColor.kCultured,
            ),
          ],
        ),

        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$20.00',
              textAlign: TextAlign.right,
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
            Text(
              '2 items',
              style: AppStyles.styleLeagueSpartanMediem14(
                context,
              ).copyWith(fontWeight: FontWeight.w300, color: AppColor.kDarkRed),
            ),
            const CustomOrderContainer(
              title: 'Track Driver',
              color: AppColor.kPinkishOrange,
              textColor: AppColor.kMainColor,
            ),
          ],
        ),
      ],
    );
  }
}
