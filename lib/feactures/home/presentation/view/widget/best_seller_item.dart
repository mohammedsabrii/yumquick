import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/best_seller_item_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/price_item.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 11.32),
      child: Stack(
        children: [
          BestSellerItemImage(),
          Positioned(bottom: 30, right: 3, child: PriceItem()),
        ],
      ),
    );
  }
}
