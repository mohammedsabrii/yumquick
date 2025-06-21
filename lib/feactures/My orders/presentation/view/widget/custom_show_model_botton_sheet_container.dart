import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomShowModalBottomSheetContainer extends StatelessWidget {
  const CustomShowModalBottomSheetContainer({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    this.onTap,
  });
  final Color color, textColor;
  final String text;
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
          child: Text(
            text,
            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
