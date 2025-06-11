import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/best_seller_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/best_seller_item_list_view.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BestSellerHeader(),
        SizedBox(height: 10),
        BestSellerItemListView(),
      ],
    );
  }
}
