import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/calculate_total_price.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_cart_item.dart';

class DrawerHaveItemCart extends StatelessWidget {
  const DrawerHaveItemCart({super.key, required this.cartEntity});
  final List<CartEntity> cartEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.kDrawerCartIcon),
            SizedBox(width: mediaQuery.width * 0.02544),
            Text(
              'Cart',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
        SizedBox(height: mediaQuery.height * 0.048),
        const Divider(thickness: 2, color: AppColor.kYellowBase),
        SizedBox(height: mediaQuery.height * 0.01829),
        Text(
          'You have ${cartEntity.length} items in the cart',
          style: AppStyles.styleLeagueSpartanregular20(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
        SizedBox(height: mediaQuery.height * 0.01219),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3434,
          child: ListView.builder(
            itemCount: cartEntity.length,
            itemBuilder: (context, index) {
              return DrawerCartItem(cartEntity: cartEntity[index]);
            },
          ),
        ),
        const CalculateTotalPrice(),
        SizedBox(height: mediaQuery.height * 0.045),
        CustomButton(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kConfirmOrderView);
          },
          color: AppColor.kYellowBase,
          title: 'Checkout',
          width: mediaQuery.width * 0.28,
          textStyle: AppStyles.styleLeagueSpartanBold20(
            context,
          ).copyWith(color: AppColor.kMainColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
