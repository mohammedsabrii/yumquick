import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_prodact.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdactsCubit, GetProdactsState>(
      builder: (context, state) {
        if (state is GetProdactsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetProdactsFaliure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetProdactsSuccess) {
          final allProducts = state.prodacts;

          return PageView.builder(
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            controller: widget.pageController,
            itemCount: categoryIds.length,
            itemBuilder: (context, index) {
              final categoryProducts =
                  allProducts
                      .where(
                        (product) => product.categoryId == categoryIds[index],
                      )
                      .toList();
              return Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.738,
                decoration:
                    categoryIds[index] == snacksCategoryId
                        ? const BoxDecoration(
                          color: AppColor.kCultured,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                          ),
                        )
                        : categoryIds[index] == drinksCategoryId
                        ? const BoxDecoration(
                          color: AppColor.kCultured,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                          ),
                        )
                        : const BoxDecoration(
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

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        '${categoryProducts[index].category} (${categoryProducts.length})',
                        style: AppStyles.styleLeagueSpartanBold24(
                          context,
                        ).copyWith(color: AppColor.kDarkRed),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView.builder(
                          itemCount: categoryProducts.length,
                          itemBuilder: (context, index) {
                            return CategoryProdact(
                              prodactsEntity: categoryProducts[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
