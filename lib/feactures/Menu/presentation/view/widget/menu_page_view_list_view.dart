import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_prodact.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class MenuPageViewListView extends StatelessWidget {
  const MenuPageViewListView({
    super.key,
    required this.scrollControllers,
    required this.categoryIds,
    required this.products,
    required this.isLoading,
    required this.pageIndex,
  });

  final Map<String, ScrollController> scrollControllers;
  final List<String> categoryIds;
  final List<ProductsEntity> products;
  final Map<String, bool> isLoading;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollControllers[categoryIds[pageIndex]],
      itemCount:
          products.length +
          ((isLoading[categoryIds[pageIndex]] ?? false) ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < products.length) {
          return CategoryProdact(prodactsEntity: products[index]);
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            ),
          );
        }
      },
    );
  }
}
