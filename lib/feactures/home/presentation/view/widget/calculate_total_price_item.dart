import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CalculateTotalPriceItem extends StatelessWidget {
  const CalculateTotalPriceItem({
    super.key,
    required this.title,
    required this.price,
    required this.color,
  });
  final String title;
  final String price;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: color),
        ),
        Text(
          price,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: color),
        ),
      ],
    );
  }
}
