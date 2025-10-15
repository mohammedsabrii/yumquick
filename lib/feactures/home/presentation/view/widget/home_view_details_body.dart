import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_category_list.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_page_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/recommend_grid_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_recommend_title.dart';

class HomeViewDetilesBody extends StatefulWidget {
  const HomeViewDetilesBody({super.key});

  @override
  State<HomeViewDetilesBody> createState() => _HomeViewDetilesBodyState();
}

class _HomeViewDetilesBodyState extends State<HomeViewDetilesBody> {
  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    context.read<GetProdactsCubit>().getProdacts(isRefresh: true);
  }

  void onScroll() {
    final cubit = context.read<GetProdactsCubit>();
    if (!cubit.hasMore || cubit.isLoading) return;

    final position = scrollController.position;
    final triggerPoint = position.maxScrollExtent * 0.8;

    if (position.pixels >= triggerPoint) {
      cubit.getProdacts(page: cubit.currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: const [
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
