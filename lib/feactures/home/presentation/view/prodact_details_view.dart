import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_view_body.dart';

class ProdactDetailsView extends StatelessWidget {
  const ProdactDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: ProdactDetailsViewBody(),
      ),
    );
  }
}
