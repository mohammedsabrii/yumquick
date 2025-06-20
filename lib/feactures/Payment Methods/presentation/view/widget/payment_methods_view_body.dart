import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/Payment%20Methods/presentation/view/widget/payment_methods_detailes.dart';

class PaymentMethodsViewBody extends StatelessWidget {
  const PaymentMethodsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0492),
        CustomPageHeader(
          title: 'Payment Methods',
          space: MediaQuery.sizeOf(context).width * 0.111,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        const PaymentMethodsDetailes(),
      ],
    );
  }
}
