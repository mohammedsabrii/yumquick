import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

class CartTotalItem extends StatefulWidget {
  final CartItem cartItem;

  const CartTotalItem({super.key, required this.cartItem});

  @override
  State<CartTotalItem> createState() => _CartTotalItemState();
}

class _CartTotalItemState extends State<CartTotalItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartModel>().updateQuantity(
              widget.cartItem.id,
              widget.cartItem.quantity - 1,
            );
          },
          child: SvgPicture.asset(AppAssets.kLessIcon),
        ),
        const SizedBox(width: 5),
        Text(
          '${widget.cartItem.quantity}',
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontSize: 13, color: AppColor.kCultured),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.read<CartModel>().updateQuantity(
              widget.cartItem.id,
              widget.cartItem.quantity + 1,
            );
          },
          child: SvgPicture.asset(AppAssets.kAddIcon),
        ),
      ],
    );
  }
}
