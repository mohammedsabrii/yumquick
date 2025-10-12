import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/model/payment_intent_input_model.dart';
import 'package:yumquick/core/model/payment_intent_model/payment_intent_model.dart';
import 'package:yumquick/core/service/stripe_service.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  final StripeService stripeService;
  StripeCubit(this.stripeService) : super(StripeInitial());

  Future<void> stripeMakePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      emit(StripeLoading());

      final paymentIntentModel = await stripeService.createPaymentIntent(
        paymentIntentInputModel,
      );

      await stripeService.initpaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      );

      await stripeService.disPlayPaymentSheet();

      emit(StripeSuccess(paymentIntentModel));
    } catch (e) {
      emit(StripeFailure(errorMessage: e.toString()));
    }
  }
}
