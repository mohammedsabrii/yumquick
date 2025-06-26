import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

class CartItemTitleAndPrice extends StatelessWidget {
  final CartItem cartItem;

  const CartItemTitleAndPrice({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.name,
          style: AppStyles.styleLeagueSpartanMediem16(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
        Text(
          '\$${cartItem.price.toStringAsFixed(2)}',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: AppColor.kCultured, fontWeight: FontWeight.w300),
        ),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: 2),
          color: AppColor.kPinkishOrange,
          title: 'Remove',
          width: 70,
          textColor: AppColor.kCultured,
          textStyle: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColor.kMainColor,
          ),
          onTap: () {
            context.read<CartModel>().removeItem(cartItem.id);
          },
        ),
      ],
    );
  }
}
