import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/more_best_seller_view_body.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';

class MoreBestSellerView extends StatelessWidget {
  const MoreBestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(),
        body: MoreBestSellerViewBody(),
      ),
    );
  }
}
