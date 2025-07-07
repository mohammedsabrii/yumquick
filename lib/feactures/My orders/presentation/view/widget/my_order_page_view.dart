import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/data/my_orders_list.dart';

class MyOrdersPageView extends StatelessWidget {
  const MyOrdersPageView({super.key, this.controller});
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: myOrdersList.length,
      itemBuilder: (context, index) => myOrdersList[index],
    );
  }
}
