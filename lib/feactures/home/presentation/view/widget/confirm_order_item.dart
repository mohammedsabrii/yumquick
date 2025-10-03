import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';

class ConfirmOrderItem extends StatelessWidget {
  const ConfirmOrderItem({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.13,
              width: MediaQuery.sizeOf(context).width * 0.183,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(cartEntity.product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartEntity.product.name,
                  style: AppStyles.styleLeagueSpartanMediem17(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.0487),
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
                    Text(
                      '\$${cartEntity.product.price}',
                      style: AppStyles.styleLeagueSpartanMediem17(
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
