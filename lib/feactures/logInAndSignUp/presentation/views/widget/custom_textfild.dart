import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomTextFaild extends StatelessWidget {
  const CustomTextFaild({
    super.key,
    // required this.lableText,
    required this.suffixIcon,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.canRequestFocus = true,
    this.lableColor = Colors.grey,
  });
  // final String lableText;
  final IconData suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText, canRequestFocus;
  final Color lableColor;
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
        // labelText: lableText,
        labelStyle: AppStyles.styleLeagueSpartanMediem14(
          context,
        ).copyWith(color: AppColor.kDarkRed),
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
