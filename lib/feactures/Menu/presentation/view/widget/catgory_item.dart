import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CatgoryItem extends StatelessWidget {
  const CatgoryItem({
    super.key,
    required this.catgoryIcon,
    required this.isActive,
    required this.catgoryActiveIcon,
    this.onTap,
  });
  final Function()? onTap;
  final String catgoryIcon, catgoryActiveIcon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: MediaQuery.sizeOf(context).width * -0.09,
              bottom: 0,
              child: SvgPicture.asset(AppAssets.kUnion),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  SvgPicture.asset(catgoryActiveIcon),
                  Text(
                    'Snacks',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleLeagueSpartanLight12(
                      context,
                    ).copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        )
        : GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              SvgPicture.asset(catgoryIcon),
              Text(
                'Snacks',
                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanLight12(
                  context,
                ).copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );
  }
}
