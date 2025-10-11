import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/model/payment_intent_input_model.dart';
import 'package:yumquick/core/service/stripe_service.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit() : super(StripeInitial());
  final StripeService stripeService = StripeService();
  Future<void> stripeMakePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripeLoading());
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      emit(StripeSuccess());
    } catch (e) {
      emit(StripeFailure(errorMessage: e.toString()));
    }
  }
}
