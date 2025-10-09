import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomOrderContainer extends StatelessWidget {
  const CustomOrderContainer({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    this.onTap,
    this.width,
    this.style,
  });
  final String title;
  final Color color, textColor;
  final Function()? onTap;
  final double? width;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        width: width ?? MediaQuery.sizeOf(context).width * 0.3,

        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:
                style ??
                AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
