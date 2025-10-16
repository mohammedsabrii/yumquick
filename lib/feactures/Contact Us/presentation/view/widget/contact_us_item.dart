import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/widget/web_view_screen.dart';

class ContactUsItem extends StatelessWidget {
  const ContactUsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.url,
    this.height = 39,
    this.width = 39,
  });

  final String icon, title, url;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: url, title: title),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * 0.0244,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon, height: height, width: width),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.0382),
                Text(
                  title,
                  style: AppStyles.styleLeagueSpartanregular20(
                    context,
                  ).copyWith(
                    color: AppColor.kDarkRed,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            RotatedBox(
              quarterTurns: 3,
              child: SvgPicture.asset(AppAssets.kBackIcon),
            ),
          ],
        ),
      ),
    );
  }
}
