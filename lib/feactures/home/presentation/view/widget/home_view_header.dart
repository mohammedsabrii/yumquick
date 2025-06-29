import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_search_text_field.dart';

class HomeViewHeader extends StatelessWidget {
  final VoidCallback onOpenCartDrawer;
  final VoidCallback onOpenNotificationDrawer;
  final VoidCallback onOpenUserDrawer;

  const HomeViewHeader({
    super.key,
    required this.onOpenCartDrawer,
    required this.onOpenNotificationDrawer,
    required this.onOpenUserDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.089),
        const CustomSaerchTextField(lableText: 'Search'),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.074),
        GestureDetector(
          onTap: onOpenCartDrawer,
          child: SvgPicture.asset(AppAssets.kCartIcon),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: onOpenNotificationDrawer,
          child: SvgPicture.asset(AppAssets.kNotiFicationIcon),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: onOpenUserDrawer,
          child: SvgPicture.asset(AppAssets.kUserIcon),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.089),
      ],
    );
  }
}
