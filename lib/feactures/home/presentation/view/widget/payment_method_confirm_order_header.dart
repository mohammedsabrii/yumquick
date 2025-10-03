// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:yumquick/core/utils/app_router.dart';
// import 'package:yumquick/core/utils/app_styles.dart';
// import 'package:yumquick/core/utils/colors.dart';
// import 'package:yumquick/core/widget/custom_button.dart';

// class PaymentMethodConfirmOrderHeader extends StatelessWidget {
//   const PaymentMethodConfirmOrderHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'Payment Method',
//           style: AppStyles.styleLeagueSpartanMediem20(
//             context,
//           ).copyWith(color: AppColor.kDarkRed),
//         ),
//         CustomButton(
//           onTap: () {
//             GoRouter.of(context).push(AppRouter.kPaymentMethods);
//           },
//           color: AppColor.kPinkishOrange,
//           title: 'Edit',
//           textStyle: AppStyles.styleLeagueSpartanregular12(
//             context,
//           ).copyWith(color: AppColor.kMainColor),
//           width: 50,
//           padding: const EdgeInsets.symmetric(),
//         ),
//       ],
//     );
//   }
// }
