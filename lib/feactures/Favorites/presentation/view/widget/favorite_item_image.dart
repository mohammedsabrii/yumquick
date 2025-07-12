import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class FavoriteItemImage extends StatelessWidget {
  const FavoriteItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.402,
          height: MediaQuery.sizeOf(context).height * 0.165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppAssets.kMaleImageTest),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: SvgPicture.asset(AppAssets.kFavoritesIconActive),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: SvgPicture.asset(AppAssets.kMealsCatgoryIcon),
        ),
      ],
    );
  }
}
