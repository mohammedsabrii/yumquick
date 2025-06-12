import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.0715,
          color: Colors.white,
          child: const CustomBouttonNavigationBar(),
        ),
        backgroundColor: AppColor.kYellowBase,
        body: const HomeViewBody(),
      ),
    );
  }
}
