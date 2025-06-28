import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_have_item_cart.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        endDrawer: DrawerHaveItemCart(),
        bottomNavigationBar: CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: HomeViewBody(),
      ),
    );
  }
}
