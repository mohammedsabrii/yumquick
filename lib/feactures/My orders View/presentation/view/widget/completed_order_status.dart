import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CompletedOrderStatus extends StatelessWidget {
  const CompletedOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAssets.kCompletedIcon),
        const SizedBox(width: 5),
        Text(
          'Order delivered',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontWeight: FontWeight.w300, color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
