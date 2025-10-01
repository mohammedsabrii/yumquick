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

  List<String> categoryIds = [
    snacksCategoryId,
    mealCategoryId,
    veganCategoryId,
    dessertCategoryId,
    drinksCategoryId,
  ];

  final Map<String, int> pageNumbers = {};
  final Map<String, bool> isLoading = {};
  final Map<String, bool> hasMore = {};
  final Map<String, ScrollController> scrollControllers = {};

  @override
  void initState() {
    super.initState();
    for (var id in categoryIds) {
      pageNumbers[id] = 1;
      isLoading[id] = false;
      hasMore[id] = true;

      scrollControllers[id] = ScrollController();
      scrollControllers[id]!.addListener(() => onScroll(id));

      BlocProvider.of<GetCategoryProdactsCubit>(
        context,
      ).getCategoryProducts(categoryId: id, pageNumber: 1);
    }
  }

  void onScroll(String categoryId) {
    if (!scrollControllers.containsKey(categoryId)) return;
    final controller = scrollControllers[categoryId]!;

    if (controller.position.pixels >=
        controller.position.maxScrollExtent * 0.8) {
      loadMore(categoryId);
    }
  }

  Future<void> loadMore(String categoryId) async {
    if (isLoading[categoryId] == true || hasMore[categoryId] == false) return;

    setState(() => isLoading[categoryId] = true);

    pageNumbers[categoryId] = (pageNumbers[categoryId] ?? 1) + 1;

    await BlocProvider.of<GetCategoryProdactsCubit>(
      context,
    ).getCategoryProducts(
      categoryId: categoryId,
      pageNumber: pageNumbers[categoryId]!,
    );

    final state = context.read<GetCategoryProdactsCubit>().state;
    if (state is GetCategoryProdactsSuccess) {
      final products = state.categoryProducts[categoryId] ?? [];
      if (products.length < 10) {
        hasMore[categoryId] = false;
      }
    }

    setState(() => isLoading[categoryId] = false);
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
          isLoading: isLoading,
          pageIndex: index,
        );
      },
    );
  }
}
