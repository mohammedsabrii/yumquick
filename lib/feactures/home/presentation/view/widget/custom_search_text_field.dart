import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';

class CustomSaerchTextField extends StatelessWidget {
  const CustomSaerchTextField({
    super.key,
    required this.lableText,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.canRequestFocus = true,
    this.lableColor = Colors.grey,
  });
  final String lableText;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText, canRequestFocus;
  final Color lableColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 26,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: CustomTextField(
        labelStyle: AppStyles.styleLeagueSpartanMediem14(
          context,
        ).copyWith(color: Colors.grey, fontSize: 12),
        canRequestFocus: canRequestFocus,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        lableText: lableText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
