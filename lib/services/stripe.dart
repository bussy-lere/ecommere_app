
import 'dart:convert';
import 'package:flutterecom/db/users.dart';
import 'package:flutterecom/services/cards.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class StripeServices {
  static const PUBLISHABLE_KEY = 'pk_test_A4nXLMSuUFOORBC9PE1x0TmK00Flkotazb';
  static const SECRET_KEY = 'sk_test_lkszgvX0S87KLLs7NmunPr5Z00F8lcHe6s';
  static const PAYMENT_METHOD_URL = 'https://api.stripe.com/v1/payment_methods';
  static const CUSTOMERS_URL = 'https://api.stripe.com/v1/customers';
  static const CHARGE_URL = 'https://api.stripe.com/v1/charges';

  Map<String, String> headers = {
    'Authorization': 'Bearer  $SECRET_KEY',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  Future<String> createStripeCustomer({String email, String userId}) async {
    Map<String, String> body = {
      'email': 'email',
    };

    String stripeId = await http.post(
        CUSTOMERS_URL, body: body, headers: headers).then((response) {
      String stripeId = jsonDecode(response.body)['id'];
      print('The stripe id is: $stripeId');
      UserServices userServices = UserServices();
      userServices.updateDetails({
        'id': userId,
        'stripeId': stripeId,
      });
      return stripeId;
    }).catchError((err) {
      print('==== THERE WAS AN ERROR ====: ${err.toString()}');
      return null;
    });

    return stripeId;
  }

  Future addCard(
      {int cardNumber, int month, int year, int cvc, String stripeId, String userId}) async {
    Map<String, dynamic> body = {
      'type': 'card',
      'card[number]': cardNumber,
      'card[exp_month]': month,
      'card[exp_year]': year,
      'card[cvc]': cvc,
    };
    Dio().post(PAYMENT_METHOD_URL, data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType, headers: headers))
        .then((response) {
      String paymentMethod = response.data['id'];
      print('=== The payment method id ===: $paymentMethod');
      http.post(
        'http://api.stripe.com/v1/payment_methods/$paymentMethod/attach',
        body: {
          'customer': stripeId,
        },
        headers: headers,
      ).then((response) {
        print('CODE ZERO');
      }).catchError((err) {
        print('ERROR ATTACHING CARD TO CUSTOMER');
        print('ERROR: ${err.toString()}');
      });

//      _attachCard();
      CardServices cardServices = CardServices();
      cardServices.createCard(id: paymentMethod,
          last4: int.parse(cardNumber.toString().substring(11)),
          exp_month: month,
          exp_year: year,
          userId: userId);
    });
  }


  Future<void> charge(String customer, int amount) async {
    Map<String, dynamic> data = {
      'amount': amount,
      'currency': 'usd',
      'source': 'tok_amex',
      'customer': customer
    };
    Dio()
        .post(CHARGE_URL, data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType, headers: headers))
        .then((response) {
      print(response.toString());
    }).catchError((err) {
      print('There was an error charging the customer: ${err.toString()}');
    });
  }


}
