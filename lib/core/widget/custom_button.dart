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
    this.isLodaing = false,
    this.circularProgressIndicatorColor,
  });
  final Color? color, textColor, circularProgressIndicatorColor;
  final String title;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool? isLodaing;
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
            child:
                isLodaing!
                    ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: circularProgressIndicatorColor ?? Colors.white,
                      ),
                    )
                    : Text(
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
