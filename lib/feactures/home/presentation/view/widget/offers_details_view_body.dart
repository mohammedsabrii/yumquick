import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_button.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_information.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_view_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_detailsprice_and_quantity.dart';

class OffersDetailsViewBody extends StatelessWidget {
  const OffersDetailsViewBody({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OffersDetailsViewHeader(offersEntity: offersEntity),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0140),
        CustomContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.089,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.0387),
                  OffersDetailsImage(offersEntity: offersEntity),
                  const SizedBox(height: 12),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 7),
                  OffersDetailspriceAndQuantity(offersEntity: offersEntity),
                  const SizedBox(height: 7),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 10),
                  OffersDetailsInformation(offersEntity: offersEntity),
                  const SizedBox(height: 20),

                  const OffersDetailsButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
