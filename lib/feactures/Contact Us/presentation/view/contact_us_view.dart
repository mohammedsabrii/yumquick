import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/widget/contact_us_view_body.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: CustomBouttonNavigationBar(),
        body: ContactUsViewBody(),
      ),
    );
  }
}
