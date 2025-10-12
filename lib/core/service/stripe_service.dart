import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumquick/core/model/payment_intent_input_model.dart';
import 'package:yumquick/core/model/payment_intent_model/payment_intent_model.dart';
import 'package:yumquick/core/service/api_service.dart';
import 'package:yumquick/core/utils/app_constant.dart';

class StripeService {
  final ApiService apiService = ApiService();
  final String stripeUrl = 'https://api.stripe.com/v1/payment_intents';
  final String refundUrl = 'https://api.stripe.com/v1/refunds';

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.tojson(),
      contentType: Headers.formUrlEncodedContentType,
      url: stripeUrl,
      token: kStripeSecretkey,
    );
    return PaymentIntentModel.fromJson(response.data);
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

  Future refundPayment(String paymentIntentId) async {
    try {
      print('🔹 Refund started for paymentIntentId: $paymentIntentId');

      var response = await apiService.post(
        body: {'payment_intent': paymentIntentId},
        contentType: Headers.formUrlEncodedContentType,
        url: refundUrl,
        token: kStripeSecretkey,
      );

      print('✅ Refund response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('❌ Refund failed');
      print('Status Code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      rethrow;
    }
  }
}
