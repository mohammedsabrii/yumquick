import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.canRequestFocus,
    required this.obscureText,
    required this.validator,
    required this.onChanged,
    required this.lableText,
    required this.suffixIcon,
    this.labelStyle,
  });

  final bool canRequestFocus;
  final bool obscureText;
  final String? Function(String? p1)? validator;
  final Function(String p1)? onChanged;
  final String lableText;
  final IconData? suffixIcon;
  final TextStyle? labelStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      canRequestFocus: canRequestFocus,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: AppStyles.styleLeagueSpartanMediem14(
        context,
      ).copyWith(color: AppColor.kDarkRed),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        labelText: lableText,
        labelStyle:
            labelStyle ??
            AppStyles.styleLeagueSpartanMediem14(
              context,
            ).copyWith(color: Colors.grey),
        suffixIcon: Icon(suffixIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color(0xFFF3E9B5)),
          gapPadding: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color(0xFFF3E9B5)),

          gapPadding: 12,
        ),
      ),
    );
  }
}
