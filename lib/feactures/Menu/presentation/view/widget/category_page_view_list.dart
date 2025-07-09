import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/data/menu_data.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_item.dart';

class CategoryPageViewList extends StatelessWidget {
  const CategoryPageViewList({
    super.key,
    required this.cruntPageIndex,
    required this.pageController,
  });
  final List<String> categoryIcon = const [
    AppAssets.kSnacksIcon,
    AppAssets.kMealIcon,
    AppAssets.kVeganIcon,
    AppAssets.kDessertsIcon,
    AppAssets.kDrinksIcon,
  ];
  final List<String> categoryActiveIcon = const [
    AppAssets.kActiveSnacksIcon,
    AppAssets.kActiveMealsIcon,
    AppAssets.kActiveVeganIcon,
    AppAssets.kActiveDessertiIcon,
    AppAssets.kActivedrinksicon,
  ];
  final List<String> categoryName = const [
    'Snacks',
    'Meal',
    'Vegan',
    'Dessert',
    'Drinks',
  ];
  final PageController pageController;
  final int cruntPageIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.089,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(menuList.length, (index) {
          return Row(
            children: [
              CategoryItem(
                onTap: () {
                  pageController.jumpToPage(index);
                },
                isActive: index == cruntPageIndex,
                categoryActiveIcon: categoryActiveIcon[index],
                categoryIcon: categoryIcon[index],
                categoryName: categoryName[index],
              ),
              if (index < categoryIcon.length - 1) const SizedBox(width: 19),
            ],
          );
        }),
      ),
    );
  }
}
