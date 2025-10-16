import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DrawerEmptyCart extends StatelessWidget {
  const DrawerEmptyCart({super.key});

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
        const Divider(thickness: 1, color: AppColor.kYellowBase),
        SizedBox(height: mediaQuery.height * 0.01829),
        Text(
          'Your cart is empty',
          style: AppStyles.styleLeagueSpartanregular20(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
        SizedBox(height: mediaQuery.height * 0.0146),
        SvgPicture.asset(AppAssets.kAddToCartIcon),
        Text(
          'Add something to your cart',
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanBold24(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
      ],
    );
  }
}
