import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/best_seller_item_image.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11.32),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kProdactDetailsView);
        },
        child: const Stack(
          children: [
            BestSellerItemImage(),
            // Positioned(bottom: 30, right: 3, child: PriceItem()),
          ],
        ),
      ),
    );
  }
}
