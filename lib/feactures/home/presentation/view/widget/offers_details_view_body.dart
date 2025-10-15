import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_information.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_details_view_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/offers_detailsprice_and_quantity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_button.dart';

class OffersDetailsViewBody extends StatefulWidget {
  const OffersDetailsViewBody({super.key, required this.productEntity});
  final ProductsEntity productEntity;

  @override
  State<OffersDetailsViewBody> createState() => _OffersDetailsViewBodyState();
}

class _OffersDetailsViewBodyState extends State<OffersDetailsViewBody> {
  int quantity = 1;

  void inc() {
    setState(() => quantity += 1);
  }

  void dec() {
    if (quantity > 1) {
      setState(() => quantity -= 1);
    }
  }

  void resetQuantity() {
    setState(() => quantity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OffersDetailsViewHeader(productEntity: widget.productEntity),
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
                  OffersDetailsImage(productEntity: widget.productEntity),
                  const SizedBox(height: 12),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 7),
                  OffersDetailspriceAndQuantity(
                    productEntity: widget.productEntity,
                    quantity: quantity,
                    onIncrement: inc,
                    onDecrement: dec,
                  ),
                  const SizedBox(height: 7),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 10),
                  OffersDetailsInformation(productEntity: widget.productEntity),
                  const SizedBox(height: 20),

                  ProdactDetailsButton(
                    productsEntity: widget.productEntity,
                    quantity: quantity,
                    onAdded: resetQuantity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
