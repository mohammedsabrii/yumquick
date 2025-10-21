import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancelled_orders.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/completed_orders.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/have_active_order.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/on_track_orders.dart';

final List<Widget> myOrdersList = [
  const HaveActiveOrder(),
  const OnTrackOrders(),
  const CompletedOrders(),
  const CancelledOrders(),
];
