import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_total_item.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';

class CartItemTitleAndPrice extends StatelessWidget {
  const CartItemTitleAndPrice({super.key, required this.cartEntity});
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartEntity.product.name,
          style: AppStyles.styleLeagueSpartanMediem16(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
        Text(
          '\$${cartEntity.product.price}',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: AppColor.kCultured, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            CustomButton(
              padding: const EdgeInsets.symmetric(vertical: 2),
              color: AppColor.kPinkishOrange,
              title: 'Remove',
              width: MediaQuery.sizeOf(context).width * 0.178,
              textColor: AppColor.kCultured,
              textStyle: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.kMainColor,
              ),
              onTap: () {
                BlocProvider.of<CartsCubit>(context).removeFromCart(cartEntity);
              },
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.089),
            CustomTotalItem(
              product: cartEntity,
              width: MediaQuery.sizeOf(context).width * 0.05,
              height: MediaQuery.sizeOf(context).height * 0.024,
              style: AppStyles.styleLeagueSpartanMediem16(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
      ],
    );
  }
}
