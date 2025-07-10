import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class FavoriteViewItem extends StatelessWidget {
  const FavoriteViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      child: Column(
        children: [
          const FavoriteItemImage(),
          const SizedBox(height: 10),
          Text(
            'Chicken Burger',
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kMainColor),
          ),
          Text(
            'Tender grilled chicken breast, topped with crisp lettuce, ripe tomato, and creamy mayo, all nestled between a soft, toasted bun.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanLight12(context),
          ),
        ],
      ),
    );
  }
}

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
