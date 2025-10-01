import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/cubit/cubit/fetch_category_products_cubit.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/menu_page_view_list_view.dart';

class MenuPageViewDetails extends StatelessWidget {
  const MenuPageViewDetails({
    super.key,
    required this.categoryIds,
    required this.scrollControllers,
    required this.isLoading,
    required this.pageIndex,
  });

  final List<String> categoryIds;
  final Map<String, ScrollController> scrollControllers;
  final Map<String, bool> isLoading;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.82,
      decoration: BoxDecoration(
        color: AppColor.kCultured,
        borderRadius:
            categoryIds[pageIndex] == snacksCategoryId
                ? const BorderRadius.only(topRight: Radius.circular(30))
                : categoryIds[pageIndex] == drinksCategoryId
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
            const SizedBox(height: 24),
            Text(
              categoryIds[pageIndex] == snacksCategoryId
                  ? "Snacks"
                  : categoryIds[pageIndex] == mealCategoryId
                  ? "Meals"
                  : categoryIds[pageIndex] == veganCategoryId
                  ? "Vegan"
                  : categoryIds[pageIndex] == dessertCategoryId
                  ? "Desserts"
                  : "Drinks",
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<
                GetCategoryProdactsCubit,
                GetCategoryProdactsState
              >(
                builder: (context, state) {
                  if (state is GetCategoryProdactsSuccess) {
                    final products =
                        state.categoryProducts[categoryIds[pageIndex]] ?? [];

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
                      isLoading: isLoading,
                      pageIndex: pageIndex,
                    );
                  } else if (state is GetCategoryProdactsFailure) {
                    customShowSnackBar(context, title: state.errorMessage);
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kMainColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
