import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_button.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_information.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_price_and_quantity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_view_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_size.dart';

class ProdactDetailsViewBody extends StatelessWidget {
  const ProdactDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProdactDetailsViewHeader(),
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
                  const ProdactDetailsImage(),
                  const SizedBox(height: 12),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 7),
                  const ProdactDetailspriceAndQuantity(),
                  const SizedBox(height: 7),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 10),
                  const ProdactDetailsInformation(),
                  const SizedBox(height: 20),
                  const ProdactSize(),
                  const SizedBox(height: 20),
                  const ProdactDetailsButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
