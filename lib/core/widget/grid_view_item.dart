import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/widget/favorite_and_rate_widget.dart';

import 'package:yumquick/core/widget/grid_view_item_back_ground_image.dart';
import 'package:yumquick/core/widget/price_item.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProdactDetailsView);
      },
      child: const Stack(
        children: [
          GridViewItemBackGroundImage(),
          Positioned(left: 13, top: 10, child: FavoriteAndRateWidget()),
          Positioned(bottom: 30, right: 1, child: PriceItem()),
        ],
      ),
    );
  }
}
