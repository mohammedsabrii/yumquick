import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/delivery_address_view_body.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';

class DeliveryAddressView extends StatelessWidget {
  const DeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(),
        body: DeliveryAddressViewBody(),
      ),
    );
  }
}
