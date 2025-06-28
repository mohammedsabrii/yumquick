import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/delivery_time_details.dart';

class DeliveryTimeViewBody extends StatelessWidget {
  const DeliveryTimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        CustomPageHeader(
          title: 'Delivery time',
          space: MediaQuery.sizeOf(context).width * 0.178,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
        const DeliveryTimeDetails(),
      ],
    );
  }
}
