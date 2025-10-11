import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumquick/core/model/payment_intent_input_model.dart';
import 'package:yumquick/core/model/payment_intent_model/payment_intent_model.dart';
import 'package:yumquick/core/service/api_service.dart';
import 'package:yumquick/core/utils/app_constant.dart';

class StripeService {
  final ApiService apiService = ApiService();
  final String stripeUrl = 'https://api.stripe.com/v1/payment_intents';
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.tojson(),
      url: stripeUrl,
      token: kStripeSecretkey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initpaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'YumQuick',
      ),
    );
  }

  Future disPlayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initpaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await disPlayPaymentSheet();
  }
}
