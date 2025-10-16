import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomRecommendTitle extends StatelessWidget {
  const CustomRecommendTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: mediaQuery.height * 0.01829),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Recommend',
            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),
        SizedBox(height: mediaQuery.height * 0.0146),
      ],
    );
  }
}
