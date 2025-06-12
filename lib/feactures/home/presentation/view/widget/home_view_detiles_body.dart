import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/best_seller.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_category_list.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_page_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/recommend_grid_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/recommend_widget.dart';

class HomeViewDetilesBody extends StatelessWidget {
  const HomeViewDetilesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.091),
              const CustomCategoryList(),
              const SizedBox(height: 12),
              const Divider(color: AppColor.kMainColor, thickness: 1),
              const SizedBox(height: 10),
              const BestSeller(),
              const OffersPageView(),
              const CustomRecommendTitle(),
            ],
          ),
        ),
        const RecommendGridView(),
      ],
    );
  }
}
