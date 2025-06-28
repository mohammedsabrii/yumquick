import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/payment_method_confirm_order_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/payment_method_confirm_order_item.dart';

class PaymentMethodConfirmOrder extends StatelessWidget {
  const PaymentMethodConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentMethodConfirmOrderHeader(),
        SizedBox(height: 13),
        PaymentMethodConfirmOrderItem(),
      ],
    );
  }
}
