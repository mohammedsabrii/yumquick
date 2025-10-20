import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/delivery_address_view_detailes.dart';

class DeliveryAddressViewBody extends StatelessWidget {
  const DeliveryAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: mq.height * 0.0492),
        CustomPageHeader(title: 'Delivery Address', space: mq.width * 0.147),
        SizedBox(height: mq.height * 0.034),
        const DeliveryAddressViewDetailes(),
      ],
    );
  }
}
