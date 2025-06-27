import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class ShippingAndEditAddress extends StatelessWidget {
  const ShippingAndEditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Shipping Address',
          style: AppStyles.styleLeagueSpartanBold24(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () => GoRouter.of(context).push(AppRouter.kDeliveryAddress),
          child: SvgPicture.asset(AppAssets.kEditIcon),
        ),
      ],
    );
  }
}
