class PaymentIntentInputModel {
  final String amount, currency;

  PaymentIntentInputModel({required this.amount, required this.currency});
  tojson() {
    return {'amount': amount, 'currency': currency};
  }
}
