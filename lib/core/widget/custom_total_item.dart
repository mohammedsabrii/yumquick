import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

class CustomTotalItem extends StatefulWidget {
  const CustomTotalItem({
    super.key,
    required this.cartItem,
    this.lessIcon,
    this.addIcon,
    this.textColor,
    this.height,
    this.width,
    this.style,
  });
  final CartItem cartItem;
  final String? lessIcon, addIcon;
  final Color? textColor;
  final double? height, width;
  final TextStyle? style;
  @override
  State<CustomTotalItem> createState() => _CustomTotalItemState();
}

class _CustomTotalItemState extends State<CustomTotalItem> {
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
          child: SvgPicture.asset(
            widget.lessIcon ?? AppAssets.kLessIcon,
            width: widget.width,
            height: widget.height,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '${widget.cartItem.quantity}',
          textAlign: TextAlign.center,
          style:
              widget.style ??
              AppStyles.styleLeagueSpartanMediem14(context).copyWith(
                fontSize: 13,
                color: widget.textColor ?? AppColor.kCultured,
              ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.read<CartModel>().updateQuantity(
              widget.cartItem.id,
              widget.cartItem.quantity + 1,
            );
          },
          child: SvgPicture.asset(
            widget.addIcon ?? AppAssets.kAddIcon,
            width: widget.width,
            height: widget.height,
          ),
        ),
      ],
    );
  }
}
