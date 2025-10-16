import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class NotificationDrawerHeader extends StatelessWidget {
  const NotificationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.kNotificationDrawerIcon,
              width: mediaQuery.width * 0.05597,
              height: mediaQuery.height * 0.0378,
            ),
            SizedBox(width: mediaQuery.width * 0.0508),
            Text(
              'Notifications',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
        SizedBox(height: mediaQuery.height * 0.048),

        const Divider(thickness: 1, color: AppColor.kCultured),
      ],
    );
  }
}
