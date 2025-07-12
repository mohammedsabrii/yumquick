import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/widget/favorite_item_image.dart';

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
