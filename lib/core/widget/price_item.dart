import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.0167,
      width: MediaQuery.sizeOf(context).width * 0.111,
      decoration: const BoxDecoration(
        color: AppColor.kMainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Text(
        '\$${productsEntity.price}',
        textAlign: TextAlign.center,
        style: AppStyles.styleLeagueSpartanregular12(
          context,
        ).copyWith(color: Colors.white),
      ),
    );
  }
}
