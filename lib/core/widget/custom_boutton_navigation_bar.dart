import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomBouttonNavigationBar extends StatelessWidget {
  const CustomBouttonNavigationBar({super.key, this.color = Colors.white});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.0715,
      color: color,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.0715,
        decoration: const ShapeDecoration(
          color: AppColor.kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.091,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                },
                child: SvgPicture.asset(AppAssets.kHomeIcon),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kMenuView);
                },
                child: SvgPicture.asset(AppAssets.kMyOrdersIcon),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kFavoriteView);
                },
                child: SvgPicture.asset(AppAssets.kFavoriteIcon),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kMyOrders);
                },
                child: SvgPicture.asset(AppAssets.kMenuIcon),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kContactUs);
                },
                child: SvgPicture.asset(AppAssets.kHelpIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
