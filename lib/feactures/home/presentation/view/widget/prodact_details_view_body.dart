import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_button.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_information.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_price_and_quantity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_view_header.dart';

class ProdactDetailsViewBody extends StatefulWidget {
  const ProdactDetailsViewBody({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;

  @override
  State<ProdactDetailsViewBody> createState() => _ProdactDetailsViewBodyState();
}

class _ProdactDetailsViewBodyState extends State<ProdactDetailsViewBody> {
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
    final mediaQuery = MediaQuery.sizeOf(context);
    final productsEntity = widget.productsEntity;
    return Column(
      children: [
        ProdactDetailsViewHeader(productsEntity: productsEntity),
        SizedBox(height: mediaQuery.height * 0.0140),
        CustomContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.089),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: mediaQuery.height * 0.0387),
                  ProdactDetailsImage(productsEntity: productsEntity),
                  const SizedBox(height: 12),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 7),
                  ProdactDetailspriceAndQuantity(
                    productsEntity: productsEntity,
                    quantity: quantity,
                    onIncrement: inc,
                    onDecrement: dec,
                  ),
                  const SizedBox(height: 7),
                  const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                  const SizedBox(height: 10),
                  ProdactDetailsInformation(productsEntity: productsEntity),
                  SizedBox(height: mediaQuery.height * 0.024),
                  ProdactDetailsButton(
                    productsEntity: productsEntity,
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
