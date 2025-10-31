import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
    required this.onOpenCartDrawer,
    required this.onOpenNotificationDrawer,
    required this.onOpenUserDrawer,
  });
  final VoidCallback onOpenCartDrawer;
  final VoidCallback onOpenNotificationDrawer;
  final VoidCallback onOpenUserDrawer;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: mediaQuery.width * 0.074),
        GestureDetector(
          onTap: onOpenCartDrawer,
          child: SvgPicture.asset(AppAssets.kCartIcon, height: 32, width: 32),
        ),
        SizedBox(width: mediaQuery.width * 0.01781),
        GestureDetector(
          onTap: onOpenNotificationDrawer,
          child: SvgPicture.asset(
            AppAssets.kNotiFicationIcon,
            height: 32,
            width: 32,
          ),
        ),
        SizedBox(width: mediaQuery.width * 0.01781),
        GestureDetector(
          onTap: onOpenUserDrawer,
          child: SvgPicture.asset(AppAssets.kUserIcon, height: 32, width: 32),
        ),
        SizedBox(width: mediaQuery.width * 0.089),
      ],
    );
  }
}
