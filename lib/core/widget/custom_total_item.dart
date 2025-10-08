import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    this.quantity,
    this.onIncrement,
    this.onDecrement,
  });
  final CartEntity product;
  final String? lessIcon, addIcon;
  final Color? textColor;
  final double? height, width;
  final TextStyle? style;
  final int? quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    final bool isLocal =
        quantity != null && (onIncrement != null || onDecrement != null);
    final cartsCubit = isLocal ? null : context.watch<CartsCubit>();
    int currentQuantity = quantity ?? product.quantity;
    int productIndex = -1;
    if (!isLocal) {
      final state = cartsCubit!.state;
      if (state is CartsSuccess) {
        final index = state.cartProducts.indexWhere(
          (cartEntity) => cartEntity.product.id == product.product.id,
        );
        if (index != -1) {
          productIndex = index;
          currentQuantity = state.cartProducts[index].quantity;
        }
      }
    }

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (isLocal) {
              if (onDecrement != null) onDecrement!();
              return;
            }
            if (productIndex != -1) {
              context.read<CartsCubit>().updateQuantity(
                product.product,
                currentQuantity - 1,
              );
            }
          },
          child: SvgPicture.asset(
            lessIcon ?? AppAssets.kLessIcon,
            width: width,
            height: height,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '$currentQuantity',
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
            if (isLocal) {
              if (onIncrement != null) onIncrement!();
              return;
            }
            if (productIndex != -1) {
              context.read<CartsCubit>().updateQuantity(
                product.product,
                currentQuantity + 1,
              );
            }
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
