import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomSignupWidget extends StatelessWidget {
  const CustomSignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',

          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: Colors.black),
        ),
        Text(
          '  Sign Up',

          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: const Color(0xFFE95322)),
        ),
      ],
    );
  }
}
