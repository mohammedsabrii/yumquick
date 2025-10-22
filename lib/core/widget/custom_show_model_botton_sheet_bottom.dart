import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomShowModalBottomSheetBottom extends StatelessWidget {
  const CustomShowModalBottomSheetBottom({
    super.key,
    required this.color,
    this.title,
    this.textColor = AppColor.kCultured,
    this.text,
    this.onTap,
  });
  final Color? color, textColor;
  final String? title;
  final Widget? text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width * 0.39,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child:
              text ??
              Text(
                title ?? '',
                style: AppStyles.styleLeagueSpartanMediem20(
                  context,
                ).copyWith(color: textColor),
              ),
        ),
      ),
    );
  }
}
