import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/cart_item_title_and_price.dart';

class DrawerCartItem extends StatelessWidget {
  const DrawerCartItem({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: mediaQuery.height * 0.01219),
        Row(
          children: [
            Container(
              height: mediaQuery.height * 0.097,
              width: mediaQuery.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(cartEntity.product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: mediaQuery.width * 0.0229),
            SizedBox(
              width: mediaQuery.width * 0.445,
              child: CartItemTitleAndPrice(cartEntity: cartEntity),
            ),
          ],
        ),
        SizedBox(height: mediaQuery.height * 0.01219),
        const Divider(thickness: 2, color: AppColor.kCultured),
      ],
    );
  }
}
