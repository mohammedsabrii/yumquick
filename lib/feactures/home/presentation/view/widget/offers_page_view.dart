import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_dot_indicator.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_offers_cubit/fetch_offers_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_offers_widget.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({super.key});

  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  late PageController pageController;
  int pageIndex = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      pageIndex = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.175,
      child: BlocBuilder<FetchOffersCubit, FetchOffersState>(
        builder: (context, state) {
          if (state is FetchOffersFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is FetchOffersLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            );
          } else if (state is FetchOffersSuccess) {
            final products =
                state.products.where((product) {
                  return product.priceAfterDiscount != null &&
                      product.priceAfterDiscount != 0 &&
                      product.priceAfterDiscount! < product.price;
                }).toList();
            if (products.isNotEmpty) {
              return PageView.builder(
                itemCount: products.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomOffersWidget(productEntity: products[index]),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: List.generate(
                          products.length,
                          (index) =>
                              CustomDotIndicator(isActive: index == pageIndex),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Text(
                'No Offers Now',
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            );
          }
        },
      ),
    );
  }
}
