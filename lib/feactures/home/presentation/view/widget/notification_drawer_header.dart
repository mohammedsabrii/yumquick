import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class NotificationDrawerHeader extends StatelessWidget {
  const NotificationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.kNotificationDrawerIcon,
              width: 22,
              height: 31,
            ),
            const SizedBox(width: 20),
            Text(
              'Notifications',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),

        const Divider(thickness: 1, color: AppColor.kCultured),
      ],
    );
  }
}
