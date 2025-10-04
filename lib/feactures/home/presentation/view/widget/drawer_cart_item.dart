import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_item_title_and_price.dart';

class DrawerCartItem extends StatelessWidget {
  const DrawerCartItem({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.097,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(cartEntity.product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 9),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.445,
              child: CartItemTitleAndPrice(cartEntity: cartEntity),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: AppColor.kCultured),
      ],
    );
  }
}
