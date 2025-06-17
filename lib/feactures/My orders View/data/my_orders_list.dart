import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/active_page_view.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/completed_orders.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/completed_orders_item.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/have_active_order.dart';

final List<Widget> myOrdersList = [
  const HaveActiveOrder(),
  const CompletedOrders(),
  const ActivePageView(),
];
