import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/address_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/payment_delivery_time.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/shipping_and_edit_address.dart';

class DeliveryTimeDetails extends StatelessWidget {
  const DeliveryTimeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.046),
            const ShippingAndEditAddress(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
            const AddressContainer(),
            const SizedBox(height: 30),
            Image.asset(AppAssets.kMapTest),
            const SizedBox(height: 25),
            const PaymentDeliveryTime(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kHomeView);
                  },
                  width: 140,
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 9,
                    bottom: 7,
                  ),
                  color: AppColor.kPinkishOrange,
                  title: 'Return Home',
                  textStyle: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
                const SizedBox(width: 20),
                CustomButton(
                  width: 140,
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 9,
                    bottom: 7,
                  ),
                  color: AppColor.kMainColor,
                  title: 'Track Order',
                  textStyle: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kCultured),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
