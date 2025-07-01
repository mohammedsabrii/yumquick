import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

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
      width: MediaQuery.sizeOf(context).width * 0.5089,
      height: 30,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: TextFormField(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kSearchView);
        },
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
          labelStyle: AppStyles.styleLeagueSpartanregular12(
            context,
          ).copyWith(color: Colors.grey),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(AppAssets.kSuffixSearchIcon),
          ),
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
    );
  }
}
