import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_total_item.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';

class ConfirmOrderItem extends StatelessWidget {
  const ConfirmOrderItem({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(cartEntity.product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.0381),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartEntity.product.name,
                  style: AppStyles.styleLeagueSpartanMediem17(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
                Text(
                  '\$${cartEntity.product.price}',
                  style: AppStyles.styleLeagueSpartanMediem17(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),

                Row(
                  children: [
                    CustomButton(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      color: AppColor.kPinkishOrange,
                      title: 'Remove',
                      width: 70,
                      textColor: AppColor.kCultured,
                      textStyle: AppStyles.styleLeagueSpartanMediem14(
                        context,
                      ).copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kMainColor,
                      ),
                      onTap: () {
                        BlocProvider.of<CartsCubit>(
                          context,
                        ).removeFromCart(cartEntity);
                      },
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.189),
                    CustomTotalItem(
                      product: cartEntity,
                      addIcon: AppAssets.kAddIconOrang,
                      lessIcon: AppAssets.kLessIconOrang,
                      style: AppStyles.styleLeagueSpartanMediem16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: AppColor.kPinkishOrange),
      ],
    );
  }
}
