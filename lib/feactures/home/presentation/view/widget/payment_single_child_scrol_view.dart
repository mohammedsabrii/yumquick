import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/feactures/home/presentation/view/method/payment_prodact_name_list_view_method.dart';
import 'package:yumquick/feactures/home/presentation/view/method/payment_prodact_quantity_list_view_method.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/payment_delivery_time.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/payment_method_confirm_order.dart';

class PaymentSingleChildScrolView extends StatelessWidget {
  const PaymentSingleChildScrolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CartModel>(
        builder: (context, cart, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Row(
                  children: [
                    paymentProdactNameListViewMethod(cart),
                    paymentProdactQuantityListViewMethod(cart),
                    Text(
                      '\$${cart.total}',
                      style: AppStyles.styleLeagueSpartanMediem20(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 2, color: AppColor.kPinkishOrange),
                const SizedBox(height: 20),
                const PaymentMethodConfirmOrder(),
                const SizedBox(height: 20),
                const PaymentDeliveryTime(),
                const SizedBox(height: 40),
                CustomButton(
                  width: 157,
                  padding: const EdgeInsets.all(5),
                  color: AppColor.kPinkishOrange,
                  title: 'Pay Now',
                  textStyle: AppStyles.styleLeagueSpartanregular23(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
