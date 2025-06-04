import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomSignupWidget extends StatelessWidget {
  const CustomSignupWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
  });
  final void Function()? onTap;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,

          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: Colors.black),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,

            style: AppStyles.styleLeagueSpartanMediem14(
              context,
            ).copyWith(color: const Color(0xFFE95322)),
          ),
        ),
      ],
    );
  }
}
