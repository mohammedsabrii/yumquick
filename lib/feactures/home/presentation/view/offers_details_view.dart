import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_view_body.dart';

class OffersDetailsView extends StatelessWidget {
  const OffersDetailsView({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: OffersDetailsViewBody(offersEntity: offersEntity),
      ),
    );
  }
}
