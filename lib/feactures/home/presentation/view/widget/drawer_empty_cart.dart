import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DrawerEmptyCart extends StatelessWidget {
  const DrawerEmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.kDrawerCartIcon),
            const SizedBox(width: 10),
            Text(
              'Cart',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        const Divider(thickness: 1, color: AppColor.kYellowBase),
        const SizedBox(height: 15),
        Text(
          'Your cart is empty',
          style: AppStyles.styleLeagueSpartanregular20(
            context,
          ).copyWith(color: AppColor.kCultured),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.146),
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
