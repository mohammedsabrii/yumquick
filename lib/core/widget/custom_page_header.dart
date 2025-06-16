import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomPageHeader extends StatelessWidget {
  const CustomPageHeader({super.key, required this.title, required this.space});
  final String title;
  final double space;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.109),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: SvgPicture.asset(AppAssets.kBackIcon),
        ),
        SizedBox(width: space),
        Align(
          child: Text(
            title,
            style: AppStyles.styleLeagueSpartanBold28(context),
          ),
        ),
      ],
    );
  }
}
