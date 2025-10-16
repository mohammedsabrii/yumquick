import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_details.dart';

class ConfirmOrderViewBody extends StatelessWidget {
  const ConfirmOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(height: mediaQuery.height * 0.035),
        CustomPageHeader(
          title: 'Confirm Order',
          space: mediaQuery.width * 0.17,
        ),
        SizedBox(height: mediaQuery.height * 0.018),
        const ConfirmOrderDetails(),
      ],
    );
  }
}
