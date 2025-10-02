import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/cubit/cubit/fetch_category_products_cubit.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/menu_page_view_list_view.dart';

class MenuPageViewDetails extends StatelessWidget {
  const MenuPageViewDetails({
    super.key,
    required this.categoryIds,
    required this.scrollControllers,
    required this.pageIndex,
  });

  final List<String> categoryIds;
  final Map<String, ScrollController> scrollControllers;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final categoryId = categoryIds[pageIndex];

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.82,
      decoration: BoxDecoration(
        color: AppColor.kCultured,
        borderRadius:
            categoryId == snacksCategoryId
                ? const BorderRadius.only(topRight: Radius.circular(30))
                : categoryId == drinksCategoryId
                ? const BorderRadius.only(topLeft: Radius.circular(30))
                : const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.01,
          left: MediaQuery.sizeOf(context).width * 0.091,
          right: MediaQuery.sizeOf(context).width * 0.091,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              getCategoryTitle(categoryId),
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<
                GetCategoryProdactsCubit,
                GetCategoryProdactsState
              >(
                buildWhen:
                    (previous, current) =>
                        current is GetCategoryProdactsSuccess ||
                        current is GetCategoryProdactsFailure ||
                        current is GetCategoryProdactsLoading,
                builder: (context, state) {
                  final cubit = context.read<GetCategoryProdactsCubit>();

                  if (state is GetCategoryProdactsLoading &&
                      (cubit.cachedProducts[categoryId]?.isEmpty ?? true)) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kMainColor,
                      ),
                    );
                  }

                  if (state is GetCategoryProdactsFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppStyles.styleLeagueSpartanMediem17(
                          context,
                        ).copyWith(color: Colors.red),
                      ),
                    );
                  }

                  final products = cubit.cachedProducts[categoryId] ?? [];
                  if (products.isEmpty) {
                    return const Center(
                      child: Text(
                        "No products found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return MenuPageViewListView(
                    scrollControllers: scrollControllers,
                    categoryIds: categoryIds,
                    products: products,
                    pageIndex: pageIndex,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCategoryTitle(String id) {
    switch (id) {
      case snacksCategoryId:
        return "Snacks";
      case mealCategoryId:
        return "Meals";
      case veganCategoryId:
        return "Vegan";
      case dessertCategoryId:
        return "Desserts";
      case drinksCategoryId:
        return "Drinks";
      default:
        return "Unknown";
    }
  }
}
