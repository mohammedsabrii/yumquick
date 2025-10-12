import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/model/payment_intent_input_model.dart';
import 'package:yumquick/core/model/payment_intent_model/payment_intent_model.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/My%20orders/entity/active_order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/stripe_cubit/stripe_cubit.dart';

Future<void> handlePaymentSuccess(
  BuildContext context,
  FetchProfileInfoSuccess profileState,
  PaymentIntentModel paymentIntentModel,
) async {
  final cartsCubit = context.read<CartsCubit>();
  final cartState = cartsCubit.state;

  if (cartState is! CartsSuccess) return;

  final cartItems =
      cartState.cartProducts.map((cart) {
        return ActiveOrderEntity(
          customerAddress: profileState.profile.address ?? '',
          customerName: profileState.profile.name ?? '',
          product: cart.product,
          quantity: cart.quantity,
          totalAmount: cart.product.price * cart.quantity,
          paymentIntentId: paymentIntentModel.id!,
          orderId: 
        );
      }).toList();

  await context.read<ActiveOrdersCubit>().insertCartOrders(cartItems);

  for (var cart in cartState.cartProducts) {
    await cartsCubit.removeFromCart(cart);
  }

  customShowSnackBar(
    context,
    title: 'Payment successful! Your order has been confirmed.',
  );
}

void handlePaymentFailure(BuildContext context, String message) {
  customShowSnackBar(context, title: 'Payment failed: $message');
}

Future<void> onConfirmPressed(BuildContext context) async {
  final cartState = BlocProvider.of<CartsCubit>(context).state;

  if (cartState is! CartsSuccess || cartState.cartProducts.isEmpty) {
    customShowSnackBar(context, title: 'Your cart is empty!');
    return;
  }

  final totalAmount = cartState.cartProducts.fold<double>(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );

  final paymentIntentInput = PaymentIntentInputModel(
    amount: totalAmount,
    currency: 'usd',
  );
  BlocProvider.of<StripeCubit>(
    context,
  ).stripeMakePayment(paymentIntentInputModel: paymentIntentInput);
}
