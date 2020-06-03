import 'package:stripe_payment/stripe_payment.dart';

class PaymentService{
  PaymentService(){
    StripePayment.setOptions(
      StripeOptions(publishableKey: '')
    );
  }
}
