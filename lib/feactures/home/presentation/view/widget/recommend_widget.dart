import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomRecommendTitle extends StatelessWidget {
  const CustomRecommendTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Recommend',

            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
