import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.kProfileImage),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.0585),
        Column(
          children: [
            Text(
              'John Smith',
              style: AppStyles.styleLeagueSpartanMediem33(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
            Text(
              'Loremipsum@email.com',
              style: AppStyles.styleLeagueSpartanMediem16(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
      ],
    );
  }
}
