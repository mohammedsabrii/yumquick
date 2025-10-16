import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class ConfirmedOrderViewBody extends StatelessWidget {
  const ConfirmedOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.089),
      child: Column(
        children: [
          SizedBox(height: mediaQuery.height * 0.0586),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: SvgPicture.asset(
                AppAssets.kBackIcon,
                height: mediaQuery.height * 0.030487,
                width: mediaQuery.width * 0.05089,
              ),
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.105),
          Center(child: SvgPicture.asset(AppAssets.kCancelcon)),
          SizedBox(height: mediaQuery.height * 0.0586),
          Text(
            '¡Order Confirmed!',
            textAlign: TextAlign.center,
            style: AppStyles.syleInterExtraBold24(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: mediaQuery.height * 0.01219),
          Text(
            'Your order has been placed succesfully',
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: mediaQuery.height * 0.02439),
          Text(
            'Delivery by Thu, 29th, 4:00 PM',
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          const Spacer(),
          Text(
            'If you have any question reach directly to our customer support',
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: mediaQuery.height * 0.0586),
        ],
      ),
    );
  }
}
