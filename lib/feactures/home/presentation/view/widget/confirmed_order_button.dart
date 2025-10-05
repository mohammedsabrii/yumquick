import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/home/entity/active_order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';

class ConfirmedOrderButton extends StatelessWidget {
  const ConfirmedOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProfileInfoCubit, FetchProfileInfoState>(
      builder: (context, state) {
        if (state is FetchProfileInfoSuccess) {
          return CustomButton(
            onTap: () async {
              final cartState = BlocProvider.of<CartsCubit>(context).state;
              if (cartState is CartsSuccess) {
                final cartItems =
                    cartState.cartProducts.map((cart) {
                      return ActiveOrderEntity(
                        customerAddress: state.profile.address ?? '',
                        customerName: state.profile.name ?? '',
                        product: cart.product,
                        quantity: cart.quantity,
                        totalAmount: cart.product.price * cart.quantity,
                      );
                    }).toList();

                await BlocProvider.of<ActiveOrdersCubit>(
                  context,
                ).insertCartOrders(cartItems);
                for (var cart in cartState.cartProducts) {
                  await BlocProvider.of<CartsCubit>(
                    context,
                  ).removeFromCart(cart);
                }
                customShowSnackBar(
                  context,
                  title: 'Your order has been confirmed',
                );
              }
            },
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            color: AppColor.kPinkishOrange,
            title: 'Confirmed Order',
            textStyle: AppStyles.styleLeagueSpartanregular18(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          );
        }
        return const CircularProgressIndicator(color: AppColor.kMainColor);
      },
    );
  }
}
