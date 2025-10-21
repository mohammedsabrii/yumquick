import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class NoActiveOrderView extends StatelessWidget {
  const NoActiveOrderView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.177),
        SvgPicture.asset(AppAssets.ktransferDocumentIcon),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanBold30(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
