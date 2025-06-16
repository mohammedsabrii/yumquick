import 'package:flutter/material.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/my%20orders%20widget/my_order_page_view_container.dart';

class CustomMyOrdersPageViewList extends StatelessWidget {
  const CustomMyOrdersPageViewList({super.key, required this.cruntPageIndex});

  final List<String> title = const ['Active', 'Completed', 'Cancelled'];
  final int cruntPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(title.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: MyOrdersPageViewContainer(
            title: title[index],
            isActive: index == cruntPageIndex,
          ),
        );
      }),
    );
  }
}
