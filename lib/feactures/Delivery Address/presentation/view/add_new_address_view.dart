import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/add_new_address_view_body.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(),
        body: AddNewAddressViewBody(),
      ),
    );
  }
}
