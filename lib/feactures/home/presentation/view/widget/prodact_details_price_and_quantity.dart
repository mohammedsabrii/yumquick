import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_total_item.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class ProdactDetailspriceAndQuantity extends StatelessWidget {
  const ProdactDetailspriceAndQuantity({
    super.key,
    required this.productsEntity,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });
  final ProductsEntity productsEntity;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  @override
  Widget build(BuildContext context) {
    return productsEntity.priceAfterDiscount != 0.0
        ? Row(
          children: [
            Text(
              '\$${productsEntity.priceAfterDiscount}',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
            const SizedBox(width: 7),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  '\$${productsEntity.price}',
                  style: AppStyles.styleLeagueSpartanBold15(
                    context,
                  ).copyWith(color: AppColor.kYellowBase),
                ),
                Positioned(
                  top: 8.5,
                  child: Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColor.kMainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomTotalItem(
              product: CartEntity.fromProduct(productsEntity),
              quantity: quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
              width: 26.31,
              height: 26.31,
              addIcon: AppAssets.kAddIconOrang,
              lessIcon: AppAssets.kLessIconOrang,
              style: AppStyles.styleLeagueSpartanregular23(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ],
        )
        : Row(
          children: [
            Text(
              '\$${productsEntity.price}',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
            const Spacer(),
            CustomTotalItem(
              product: CartEntity.fromProduct(productsEntity),
              quantity: quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
              width: 26.31,
              height: 26.31,
              addIcon: AppAssets.kAddIconOrang,
              lessIcon: AppAssets.kLessIconOrang,
              style: AppStyles.styleLeagueSpartanregular23(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ],
        );
  }
}
