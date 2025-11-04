import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/cubit/cubit/fetch_category_products_cubit.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/menu_page_view_details.dart';

class MenuPageView extends StatefulWidget {
  const MenuPageView({super.key, this.pageController});
  final PageController? pageController;

  @override
  State<MenuPageView> createState() => _MenuPageViewState();
}

class _MenuPageViewState extends State<MenuPageView> {
  int currentPageIndex = 0;

  final List<String> categoryIds = [
    snacksCategoryId,
    mealCategoryId,
    veganCategoryId,
    dessertCategoryId,
    drinksCategoryId,
  ];

  final Map<String, ScrollController> scrollControllers = {};

  @override
  void initState() {
    super.initState();
    for (var id in categoryIds) {
      scrollControllers[id] = ScrollController();
      scrollControllers[id]!.addListener(() => onScroll(id));
    }
    // Initialize categories in the Cubit
    BlocProvider.of<GetCategoryProdactsCubit>(
      context,
    ).initializeCategories(categoryIds);
  }

  void onScroll(String categoryId) {
    if (!scrollControllers.containsKey(categoryId)) return;
    final controller = scrollControllers[categoryId]!;
    final cubit = BlocProvider.of<GetCategoryProdactsCubit>(context);

    if (controller.position.pixels >=
            controller.position.maxScrollExtent * 0.8 &&
        cubit.isLoading[categoryId] != true &&
        cubit.hasMore[categoryId] != false) {
      cubit.loadMore(categoryId);
    }
  }

  @override
  void dispose() {
    for (var controller in scrollControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      onPageChanged: (index) => setState(() => currentPageIndex = index),
      itemCount: categoryIds.length,
      itemBuilder: (context, index) {
        return MenuPageViewDetails(
          categoryIds: categoryIds,
          scrollControllers: scrollControllers,
          pageIndex: index,
        );
      },
    );
  }
}
