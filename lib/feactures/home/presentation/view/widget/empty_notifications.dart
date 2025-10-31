import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.kNotiFicationIcon),
            SizedBox(width: mediaQuery.width * 0.02544),
            Text(
              'Notifications',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
        SizedBox(height: mediaQuery.height * 0.048),
        const Divider(thickness: 1, color: AppColor.kYellowBase),
        SizedBox(height: mediaQuery.height * 0.01829),

        SvgPicture.asset(AppAssets.kEmptyNotification),
        Text(
          'No Notifications Yet',
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanBold24(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
      ],
    );
  }
}
