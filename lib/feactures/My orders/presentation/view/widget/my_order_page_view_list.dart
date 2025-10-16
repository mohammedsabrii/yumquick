import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/my_order_page_view_container.dart';

class CustomMyOrdersPageViewList extends StatelessWidget {
  const CustomMyOrdersPageViewList({super.key, required this.cruntPageIndex});

  final List<String> title = const [
    'Active',
    'On Track',
    'Completed',
    'Cancelled',
  ];
  final int cruntPageIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.03658,
      child: ListView.builder(
        itemCount: title.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: MyOrdersPageViewContainer(
              title: title[index],
              isActive: index == cruntPageIndex,
            ),
          );
        },
      ),
    );
  }
}
