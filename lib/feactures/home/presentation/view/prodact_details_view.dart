import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_details_view_body.dart';

class ProdactDetailsView extends StatelessWidget {
  const ProdactDetailsView({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: ProdactDetailsViewBody(productsEntity: productsEntity),
      ),
    );
  }
}
