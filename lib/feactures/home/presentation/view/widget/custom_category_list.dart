import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/category_model.dart';

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
      height: 80,
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

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width * 0.0483,
      ),
      child: Column(
        children: [
          SvgPicture.asset(model.icon),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanregular12(context),
          ),
        ],
      ),
    );
  }
}
