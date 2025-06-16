import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/my%20orders%20widget/my_order_page_view_with_index.dart';

class MyOrdersViewBodyDetails extends StatelessWidget {
  const MyOrdersViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.042),
          const MyOrdersPageViewWithIndex(),
        ],
      ),
    );
  }
}
