import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
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
        children: List.generate(categoryIcon.length, (index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: CategoryItem(
                  onTap: () {
                    pageController.jumpToPage(index);
                  },
                  isActive: index == cruntPageIndex,

                  categoryIcon: categoryIcon[index],
                  categoryName: categoryName[index],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
