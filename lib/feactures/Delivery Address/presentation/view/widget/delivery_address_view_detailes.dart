import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/delivery_address_item.dart';

class DeliveryAddressViewDetailes extends StatelessWidget {
  const DeliveryAddressViewDetailes({super.key});

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
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.041),
            const Divider(thickness: 1, color: AppColor.kMainColor),
            const DeliveryAddressItem(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAddNewAddess);
              },
              color: AppColor.kPinkishOrange,
              title: 'Add New Address',
              textStyle: AppStyles.styleLeagueSpartanMediem17(
                context,
              ).copyWith(color: AppColor.kMainColor),
              width: MediaQuery.sizeOf(context).width * 0.379,
            ),
          ],
        ),
      ),
    );
  }
}
