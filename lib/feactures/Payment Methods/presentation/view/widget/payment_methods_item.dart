import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class PaymentMethodsItem extends StatelessWidget {
  const PaymentMethodsItem({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0293),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.0814),
                Text(
                  title,
                  style: AppStyles.styleLeagueSpartanregular20(context),
                ),
              ],
            ),

            SvgPicture.asset(AppAssets.kSelectedCheckedPointIcon),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        const Divider(thickness: 1, color: AppColor.kMainColor),
      ],
    );
  }
}
