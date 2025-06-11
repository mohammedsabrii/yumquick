import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/best_seller_item.dart';

class BestSellerItemListView extends StatelessWidget {
  const BestSellerItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.13,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const BestSellerItem();
        },
      ),
    );
  }
}
