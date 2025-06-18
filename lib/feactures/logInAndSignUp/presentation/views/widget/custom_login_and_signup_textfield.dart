// import 'package:flutter/material.dart';
// import 'package:yumquick/core/widget/custom_text_field.dart';

// class CustomLogInAndSignUpTextField extends StatelessWidget {
//   const CustomLogInAndSignUpTextField({
//     super.key,
//     required this.lableText,
//     this.suffixIcon,
//     this.onChanged,
//     this.validator,
//     this.obscureText = false,
//     this.canRequestFocus = true,
//     this.lableColor = Colors.grey,
//   });
//   final String lableText;
//   final IconData? suffixIcon;
//   final String? Function(String?)? validator;
//   final Function(String)? onChanged;
//   final bool obscureText, canRequestFocus;
//   final Color lableColor;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       width: MediaQuery.sizeOf(context).width * 0.82,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(13),
//         color: const Color(0xFFF3E9B5),
//       ),
//       child: CustomTextField(
//         textFieldTitle: ,
//         canRequestFocus: canRequestFocus,
//         obscureText: obscureText,
//         validator: validator,
//         onChanged: onChanged,
//         lableText: lableText,
//         suffixIcon: suffixIcon,
//       ),
//     );
//   }
// }
