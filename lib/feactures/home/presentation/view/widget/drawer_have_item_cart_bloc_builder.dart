import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_have_item_cart.dart';

class DrawerHaveItemCartBlocBuilder extends StatelessWidget {
  const DrawerHaveItemCartBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        if (state is CartsSuccess) {
          return DrawerHaveItemCart(cartEntity: state.cartProducts);
        } else if (state is CartsFailure) {
          return Text(
            state.errorMessage,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kCultured),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kCultured),
          );
        }
      },
    );
  }
}
