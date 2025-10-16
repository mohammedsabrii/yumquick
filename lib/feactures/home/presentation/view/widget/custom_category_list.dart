import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/category_model.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_category.dart';

class CustomCategoryList extends StatelessWidget {
  const CustomCategoryList({super.key});
  final List<CategoryModel> categorys = const [
    CategoryModel(icon: AppAssets.kSnacksIcon, title: 'Snacks'),
    CategoryModel(icon: AppAssets.kMealIcon, title: 'Meal'),
    CategoryModel(icon: AppAssets.kVeganIcon, title: 'Vegan'),
    CategoryModel(icon: AppAssets.kDessertsIcon, title: 'Dessert'),
    CategoryModel(icon: AppAssets.kDrinksIcon, title: 'Drinks'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorys.length,
        itemBuilder: (context, index) {
          return CustomCategory(model: categorys[index]);
        },
      ),
    );
  }
}
