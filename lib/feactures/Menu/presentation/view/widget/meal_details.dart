import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_header.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/meal_category_list_view.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.738,
      decoration: const BoxDecoration(
        color: AppColor.kCultured,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: const Column(
          children: [CategoryHeader(), Expanded(child: MealCategoryListView())],
        ),
      ),
    );
  }
}
