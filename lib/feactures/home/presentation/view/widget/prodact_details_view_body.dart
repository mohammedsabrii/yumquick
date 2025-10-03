import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_button.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_information.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_price_and_quantity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_view_header.dart';

class ProdactDetailsViewBody extends StatelessWidget {
  const ProdactDetailsViewBody({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProdactDetailsViewHeader(productsEntity: productsEntity),
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
                  ProdactDetailsImage(productsEntity: productsEntity),
                  const SizedBox(height: 12),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 7),
                  ProdactDetailspriceAndQuantity(
                    productsEntity: productsEntity,
                  ),
                  const SizedBox(height: 7),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 10),
                  ProdactDetailsInformation(productsEntity: productsEntity),
                  const SizedBox(height: 20),

                  ProdactDetailsButton(productsEntity: productsEntity),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
