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
    required this.hintText,
    this.suffixIcon,
    this.hintStyle,
    required this.textFieldTitle,
    this.controller,
  });

  final bool? canRequestFocus;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String p1)? onChanged;
  final String hintText, textFieldTitle;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> fieldState) {
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
                border: Border.all(
                  color:
                      fieldState.hasError
                          ? Colors.red
                          : const Color(0xFFF3E9B5),
                  width: 2,
                ),
              ),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.black,
                canRequestFocus: canRequestFocus ?? true,
                obscureText: obscureText ?? false,
                onChanged: (value) {
                  onChanged?.call(value);
                  fieldState.didChange(value);
                },
                style: AppStyles.styleLeagueSpartanMediem14(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  enabledBorder: outLineInputBorderMethod(),
                  focusedBorder: outLineInputBorderMethod(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  hintText: hintText,
                  hintStyle:
                      hintStyle ??
                      AppStyles.styleLeagueSpartanMediem14(
                        context,
                      ).copyWith(color: Colors.grey),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
            if (fieldState.hasError)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fieldState.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  OutlineInputBorder outLineInputBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Color(0xFFF3E9B5)),
      gapPadding: 12,
    );
  }
}
