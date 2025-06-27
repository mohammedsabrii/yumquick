import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_view_body.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';

class ConfirmOrderView extends StatelessWidget {
  const ConfirmOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(),
        body: ConfirmOrderViewBody(),
      ),
    );
  }
}
