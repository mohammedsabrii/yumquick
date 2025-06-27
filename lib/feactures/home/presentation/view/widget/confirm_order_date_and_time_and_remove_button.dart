import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

class ConfirmOrderDateAndTimeAndRemoveButton extends StatelessWidget {
  const ConfirmOrderDateAndTimeAndRemoveButton({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.name,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        Text(
          '${cartItem.date}, ${cartItem.time} ',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: AppColor.kDarkRed, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 5),
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
