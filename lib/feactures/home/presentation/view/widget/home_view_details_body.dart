import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_category_list.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_page_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/recommend_grid_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_recommend_title.dart';

class HomeViewDetilesBody extends StatelessWidget {
  const HomeViewDetilesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomCategoryList(),
              SizedBox(height: 12),
              Divider(color: AppColor.kMainColor, thickness: 1),
              SizedBox(height: 10),
              OffersPageView(),
              CustomRecommendTitle(),
            ],
          ),
        ),
        RecommendGridView(),
      ],
    );
  }
}
