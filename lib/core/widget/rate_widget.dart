import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.0164,
      width: MediaQuery.sizeOf(context).width * 0.0865,
      decoration: BoxDecoration(
        color: Colors.white,
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
            ).copyWith(color: Colors.black),
          ),
          SvgPicture.asset(AppAssets.kStar),
        ],
      ),
    );
  }
}
