import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.title,
    this.textColor = AppColor.kMainColor,
    this.onTap,
    this.textStyle,
    this.width,
    this.padding,
  });
  final Color color, textColor;
  final String title;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final double? width;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? MediaQuery.sizeOf(context).width * 0.526,
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:
                  textStyle ??
                  AppStyles.styleLeagueSpartanBold24(
                    context,
                  ).copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
