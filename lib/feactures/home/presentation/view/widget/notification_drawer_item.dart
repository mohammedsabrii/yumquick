import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class NotificationsDrawerItem extends StatelessWidget {
  const NotificationsDrawerItem({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                title,
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
        const Divider(thickness: 1, color: AppColor.kCultured),
      ],
    );
  }
}
