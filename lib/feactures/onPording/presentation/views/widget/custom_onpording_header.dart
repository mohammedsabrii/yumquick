import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomOnpordingHeader extends StatelessWidget {
  const CustomOnpordingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(AppRouter.kStartView);
      },
      child: Row(
        children: [
          Text(
            'Skip',
            style: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColor.kMainColor,
            ),
          ),
          const SizedBox(width: 7),
          SvgPicture.asset(AppAssets.kNextIcon, height: 22, width: 15),
        ],
      ),
    );
  }
}
