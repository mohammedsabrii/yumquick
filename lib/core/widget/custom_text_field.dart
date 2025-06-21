import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.canRequestFocus,
    this.obscureText,
    this.validator,
    this.onChanged,
    required this.lableText,
    this.suffixIcon,
    this.labelStyle,
    required this.textFieldTitle,
  });

  final bool? canRequestFocus;
  final bool? obscureText;
  final String? Function(String? p1)? validator;
  final Function(String p1)? onChanged;
  final String lableText, textFieldTitle;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,

          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const SizedBox(height: 10),
        Container(
          height: 45,
          width: MediaQuery.sizeOf(context).width * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color(0xFFF3E9B5),
          ),
          child: TextFormField(
            cursorColor: Colors.black,
            canRequestFocus: canRequestFocus ?? true,
            obscureText: obscureText ?? false,
            validator: validator,
            onChanged: onChanged,
            style: AppStyles.styleLeagueSpartanMediem14(
              context,
            ).copyWith(color: AppColor.kDarkRed),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              labelText: lableText,
              labelStyle:
                  labelStyle ??
                  AppStyles.styleLeagueSpartanMediem14(
                    context,
                  ).copyWith(color: Colors.grey),
              suffixIcon: suffixIcon,

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
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
