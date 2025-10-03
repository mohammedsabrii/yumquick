// import 'package:flutter/widgets.dart';
// import 'package:yumquick/core/utils/app_assets.dart';
// import 'package:yumquick/core/utils/app_styles.dart';
// import 'package:yumquick/core/utils/colors.dart';
// import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
// import 'package:yumquick/core/widget/custom_total_item.dart';

// class ConfirmOrderPriceAndTotalItems extends StatelessWidget {
//   const ConfirmOrderPriceAndTotalItems({super.key, required this.cartItem});
//   final CartItem cartItem;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Text(
//           '\$${cartItem.price.toStringAsFixed(2)}',
//           textAlign: TextAlign.right,
//           style: AppStyles.styleLeagueSpartanMediem20(
//             context,
//           ).copyWith(color: AppColor.kMainColor),
//         ),
//         Text(
//           '${cartItem.quantity} items',
//           style: AppStyles.styleLeagueSpartanMediem14(
//             context,
//           ).copyWith(color: AppColor.kDarkRed, fontWeight: FontWeight.w300),
//         ),
//         CustomTotalItem(
//           product: cartItem,
//           // cartItem: cartItem,
//           // addIcon: AppAssets.kAddIconOrang,
//           // lessIcon: AppAssets.kLessIconOrang,
//           // textColor: AppColor.kDarkRed,
//         ),
//       ],
//     );
//   }
// }
