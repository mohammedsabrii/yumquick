import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/more_best_seller_item.dart';

class MoreBestSellerDetails extends StatelessWidget {
  const MoreBestSellerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.0398,
                        ),

                        Text(
                          'Discover our most popular dishes!',
                          textAlign: TextAlign.center,
                          style: AppStyles.styleLeagueSpartanMediem20(
                            context,
                          ).copyWith(color: AppColor.kMainColor),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.0281,
                        ),
                      ],
                    ),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return const MoreBestSellerItem();
                    }, childCount: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100,
                        ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.128,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
