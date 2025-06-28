import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/address_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/calculate_total_price.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/shipping_and_edit_address.dart';

class ConfirmOrderDetails extends StatelessWidget {
  const ConfirmOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.046),
            const ShippingAndEditAddress(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
            const AddressContainer(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0586),
            Text(
              'Order Summary',
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const Divider(color: AppColor.kPinkishOrange, thickness: 2),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, cart, child) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) {
                            return ConfirmOrderItem(
                              cartItem: cart.items[index],
                            );
                          },
                        ),
                        const CalculateTotalPrice(
                          color: AppColor.kDarkRed,
                          dividerColor: AppColor.kPinkishOrange,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kPaymentView);
                          },
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 5,
                          ),
                          color: AppColor.kPinkishOrange,
                          title: 'Place Order',
                          textStyle: AppStyles.styleLeagueSpartanregular23(
                            context,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
