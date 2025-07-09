import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_item.dart';

class CatgoryPageViewList extends StatelessWidget {
  const CatgoryPageViewList({
    super.key,
    required this.cruntPageIndex,
    required this.pageController,
  });
  final List<String> catgoryIcon = const [
    AppAssets.kSnacksIcon,
    AppAssets.kMealIcon,
    AppAssets.kVeganIcon,
    AppAssets.kDessertsIcon,
    AppAssets.kDrinksIcon,
  ];
  final List<String> catgoryActiveIcon = const [
    AppAssets.kActiveSnacksIcon,
    AppAssets.kActiveMealsIcon,
    AppAssets.kActiveVeganIcon,
    AppAssets.kActiveDessertiIcon,
    AppAssets.kActivedrinksicon,
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
        children: List.generate(catgoryIcon.length, (index) {
          return Row(
            children: [
              CatgoryItem(
                onTap: () {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                isActive: index == cruntPageIndex,
                catgoryActiveIcon: catgoryActiveIcon[index],
                catgoryIcon: catgoryIcon[index],
              ),
              if (index < catgoryIcon.length - 1) SizedBox(width: 19),
            ],
          );
        }),
      ),
    );
  }
}
