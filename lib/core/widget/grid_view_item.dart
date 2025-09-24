import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/widget/favorite_and_rate_widget.dart';
import 'package:yumquick/core/widget/favorite_widget.dart';

import 'package:yumquick/core/widget/grid_view_item_back_ground_image.dart';
import 'package:yumquick/core/widget/price_item.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(AppRouter.kProdactDetailsView, extra: productsEntity);
          },
          child: Stack(
            children: [
              GridViewItemBackGroundImage(productsEntity: productsEntity),

              Positioned(
                bottom: 30,
                right: 1,
                child: PriceItem(productsEntity: productsEntity),
              ),
            ],
          ),
        ),
        Positioned(
          right: 13,
          top: 10,
          child: FavoriteWidget(productsEntity: productsEntity),
        ),
      ],
    );
  }
}
