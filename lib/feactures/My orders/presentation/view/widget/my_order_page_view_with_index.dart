import 'package:flutter/material.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/my_order_page_view.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/my_order_page_view_list.dart';

class MyOrdersPageViewWithIndex extends StatefulWidget {
  const MyOrdersPageViewWithIndex({super.key});

  @override
  State<MyOrdersPageViewWithIndex> createState() =>
      _MyOrdersPageViewWithIndexState();
}

class _MyOrdersPageViewWithIndexState extends State<MyOrdersPageViewWithIndex> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          CustomMyOrdersPageViewList(cruntPageIndex: pageIndex),
          const SizedBox(height: 20),

          Expanded(child: MyOrdersPageView(controller: pageController)),
        ],
      ),
    );
  }
}
