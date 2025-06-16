import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomBouttonNavigationBar extends StatelessWidget {
  const CustomBouttonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.0715,
      color: Colors.white,
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
              SvgPicture.asset(AppAssets.kHomeIcon),
              SvgPicture.asset(AppAssets.kMyOrdersIcon),
              SvgPicture.asset(AppAssets.kFavoriteIcon),
              SvgPicture.asset(AppAssets.kMenuIcon),
              SvgPicture.asset(AppAssets.kHelpIcon),
            ],
          ),
        ),
      ),
    );
  }
}
