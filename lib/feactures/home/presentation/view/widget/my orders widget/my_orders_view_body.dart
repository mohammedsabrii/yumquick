import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/my%20orders%20widget/my_orders_view_body_details.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        CustomPageHeader(
          title: 'My Orders',
          space: MediaQuery.sizeOf(context).width * 0.22,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        const MyOrdersViewBodyDetails(),
      ],
    );
  }
}
