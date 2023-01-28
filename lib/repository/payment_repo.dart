import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentRepo {
  Map<String, dynamic>? paymentIntent;
  String SECRET_KEY = "sk_test_51MLXgRBX41Z5Zv6zAvmMF9bEjIQMNxbLKY499vTpJcVzaigks23vlogwAAXifm4M2Ng3nNNYieTpUBI0jeEq5IIE00L8yvHR1Q";
  createPaymentIntent(String price, String currency) async {
    Map<String, dynamic> body = {'amount': calculateAmount(price), 'currency': currency, 'payment_method_types[]': 'card'};
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {'Authorization': 'Bearer $SECRET_KEY', 'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    print('Payment Intent Body->>> ${response.body.toString()}');
    return jsonDecode(response.body);
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  Future<Map<String, dynamic>> makePayment(String ammount) async {
    paymentIntent = await createPaymentIntent(ammount, 'USD');
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(paymentIntentClientSecret: paymentIntent!['client_secret']));
    return paymentIntent!;
  }
}
