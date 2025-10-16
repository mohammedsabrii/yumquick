import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/address_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_bloc_builder.dart';
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
            const ConfirmOrderBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
