import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirmed_order_view_body.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';

class ConfirmedOrderView extends StatelessWidget {
  const ConfirmedOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(
          color: AppColor.kYellowBase,
        ),
        body: ConfirmedOrderViewBody(),
      ),
    );
  }
}
