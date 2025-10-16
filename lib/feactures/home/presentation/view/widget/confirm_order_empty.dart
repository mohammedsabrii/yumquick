import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class ConfirmOrderEmpty extends StatelessWidget {
  const ConfirmOrderEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.kAddToCartIcon,
          colorFilter: const ColorFilter.mode(
            AppColor.kMainColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01219),
        Text(
          'Add something to your cart',
          style: AppStyles.styleLeagueSpartanBold24(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
