import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

Expanded paymentProdactNameListViewMethod(CartModel cart) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        return Text(
          cart.items[index].name,
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: AppColor.kDarkRed, fontWeight: FontWeight.w300),
        );
      },
    ),
  );
}
