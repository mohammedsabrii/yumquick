import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/delivery_address_bloc_bulider.dart';

class DeliveryAddressViewDetailes extends StatelessWidget {
  const DeliveryAddressViewDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.089),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mq.height * 0.041),
            const Divider(thickness: 1, color: AppColor.kMainColor),
            const DeliveryAddressBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
