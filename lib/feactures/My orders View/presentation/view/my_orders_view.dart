import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: MyOrdersViewBody(),
      ),
    );
  }
}
