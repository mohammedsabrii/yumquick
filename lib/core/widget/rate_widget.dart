import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, this.color, this.textColor});
  final Color? color, textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.0164,
      width: MediaQuery.sizeOf(context).width * 0.0865,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            '5.0',
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanregular12(
              context,
            ).copyWith(color: textColor ?? AppColor.kDarkRed),
          ),
          const SizedBox(width: 3),
          SvgPicture.asset(AppAssets.kStar),
        ],
      ),
    );
  }
}
