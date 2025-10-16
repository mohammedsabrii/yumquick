import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title, icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: mediaQuery.width * 0.0585),
                Text(
                  title,
                  style: AppStyles.styleLeagueSpartanBold24(context).copyWith(
                    color: AppColor.kCultured,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.01219),
            const Divider(thickness: 1, color: AppColor.kCultured),
          ],
        ),
      ),
    );
  }
}
