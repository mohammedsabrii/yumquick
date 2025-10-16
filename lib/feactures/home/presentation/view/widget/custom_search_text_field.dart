import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomSaerchTextField extends StatelessWidget {
  const CustomSaerchTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.lableColor = Colors.grey,
    this.controller,
    this.onFieldSubmitted,
  });
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Color lableColor;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Container(
      width: mediaQuery.width * 0.5089,
      height: mediaQuery.height * 0.487,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        style: AppStyles.styleLeagueSpartanMediem17(
          context,
        ).copyWith(color: AppColor.kDarkRed),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: hintText,
          hintStyle: AppStyles.styleLeagueSpartanregular12(
            context,
          ).copyWith(color: Colors.grey),
          labelStyle: AppStyles.styleLeagueSpartanregular12(
            context,
          ).copyWith(color: Colors.grey),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFF3E9B5)),
            gapPadding: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFF3E9B5)),
            gapPadding: 12,
          ),
        ),
      ),
    );
  }
}
