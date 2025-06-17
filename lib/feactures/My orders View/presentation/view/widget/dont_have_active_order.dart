import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DontHaveActiveOrder extends StatelessWidget {
  const DontHaveActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.177),
        SvgPicture.asset(AppAssets.ktransferDocumentIcon),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        Text(
          'You don`t have any active orders at this time',
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanBold30(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
