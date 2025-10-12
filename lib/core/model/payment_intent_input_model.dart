class PaymentIntentInputModel {
  final String currency;
  final num amount;

  PaymentIntentInputModel({required this.amount, required this.currency});
  tojson() {
    return {'amount': (amount * 100).toInt().toString(), 'currency': currency};
  }
}
