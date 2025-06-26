import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_cart_item.dart';

class DrawerHaveItemCart extends StatelessWidget {
  const DrawerHaveItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Column(
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
          const Divider(thickness: 2, color: AppColor.kYellowBase),
          const SizedBox(height: 15),
          Text(
            'You have 2 items in the cart',
            style: AppStyles.styleLeagueSpartanregular20(
              context,
            ).copyWith(color: AppColor.kCultured),
          ),
          const SizedBox(height: 20),
          const DrawerCartItem(),
        ],
      ),
    );
  }
}
