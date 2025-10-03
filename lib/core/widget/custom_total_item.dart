import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';

class CustomTotalItem extends StatelessWidget {
  const CustomTotalItem({
    super.key,
    required this.product,
    this.lessIcon,
    this.addIcon,
    this.textColor,
    this.height,
    this.width,
    this.style,
  });
  final CartEntity product;
  final String? lessIcon, addIcon;
  final Color? textColor;
  final double? height, width;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartsCubit>().updateQuantity(
              product.product,
              product.quantity - 1,
            );
          },
          child: SvgPicture.asset(
            lessIcon ?? AppAssets.kLessIcon,
            width: width,
            height: height,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '${product.quantity}',
          textAlign: TextAlign.center,
          style:
              style ??
              AppStyles.styleLeagueSpartanMediem14(
                context,
              ).copyWith(fontSize: 13, color: textColor ?? AppColor.kCultured),
        ),

        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.read<CartsCubit>().updateQuantity(
              product.product,
              product.quantity + 1,
            );
          },
          child: SvgPicture.asset(
            addIcon ?? AppAssets.kAddIcon,
            width: width,
            height: height,
          ),
        ),
      ],
    );
  }
}
