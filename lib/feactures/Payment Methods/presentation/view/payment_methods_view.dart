import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Payment%20Methods/presentation/view/widget/payment_methods_view_body.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(),
        body: PaymentMethodsViewBody(),
      ),
    );
  }
}
