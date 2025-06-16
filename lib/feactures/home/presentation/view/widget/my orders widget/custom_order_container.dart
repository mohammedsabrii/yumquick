import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomOrderContainer extends StatelessWidget {
  const CustomOrderContainer({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
  });
  final String title;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.28,
      height: 33,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanMediem17(
            context,
          ).copyWith(color: textColor),
        ),
      ),
    );
  }
}
