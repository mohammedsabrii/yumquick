import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DeliveryAddressItem extends StatelessWidget {
  const DeliveryAddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0293),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppAssets.kdeliveryHomeIcon),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.0381),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My home',
                  style: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Text(
                  '778 Locust View Drive Oakland, CA',
                  style: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
                    color: AppColor.kDarkRed,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.0534),
            SvgPicture.asset(AppAssets.kcheckPointIcon),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0293),

        const Divider(thickness: 1, color: AppColor.kMainColor),
      ],
    );
  }
}
