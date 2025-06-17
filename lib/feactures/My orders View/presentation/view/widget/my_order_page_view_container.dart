import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class MyOrdersPageViewContainer extends StatelessWidget {
  const MyOrdersPageViewContainer({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.264,
      height: 28,
      decoration: ShapeDecoration(
        color: isActive ? AppColor.kMainColor : AppColor.kPinkishOrange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanMediem17(context).copyWith(
            color: isActive ? AppColor.kCultured : AppColor.kMainColor,
          ),
        ),
      ),
    );
  }
}
