import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/calculate_total_price.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirmed_order_button.dart';

class ConfirmOrderHaveItems extends StatelessWidget {
  const ConfirmOrderHaveItems({super.key, required this.cartEntity});
  final List<CartEntity> cartEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartEntity.length,
            itemBuilder: (context, index) {
              return ConfirmOrderItem(cartEntity: cartEntity[index]);
            },
          ),
          const CalculateTotalPrice(
            color: AppColor.kDarkRed,
            dividerColor: AppColor.kPinkishOrange,
          ),
          SizedBox(height: mediaQuery.height * 0.0365),
          const ConfirmedOrderButton(),

          SizedBox(height: mediaQuery.height * 0.0365),
        ],
      ),
    );
  }
}
