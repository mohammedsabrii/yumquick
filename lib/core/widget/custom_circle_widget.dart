import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomCircleWidget extends StatelessWidget {
  const CustomCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 8, color: AppColor.kYellowBase),
        ),
      ),
    );
  }
}
