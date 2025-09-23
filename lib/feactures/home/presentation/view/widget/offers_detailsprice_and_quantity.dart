import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_total_item.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

class OffersDetailspriceAndQuantity extends StatelessWidget {
  const OffersDetailspriceAndQuantity({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, prodact, child) {
        return offersEntity.priceAfterDiscount != 0.0
            ? Row(
              children: [
                Text(
                  '\$${offersEntity.priceAfterDiscount}',
                  style: AppStyles.styleLeagueSpartanBold24(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
                const SizedBox(width: 7),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      '\$${offersEntity.price}',
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
                  cartItem: prodact.items.first,
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
                  '\$${offersEntity.price}',
                  style: AppStyles.styleLeagueSpartanBold24(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
                const Spacer(),
                CustomTotalItem(
                  cartItem: prodact.items.first,
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
      },
    );
  }
}
