import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancel_order_view_body.dart';

class CancelOrderView extends StatelessWidget {
  const CancelOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBouttonNavigationBar(
          color: AppColor.kYellowBase,
        ),
        backgroundColor: AppColor.kYellowBase,
        body: CancelOrderViewBody(),
      ),
    );
  }
}
