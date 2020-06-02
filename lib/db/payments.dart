import 'package:stripe_payment/stripe_payment.dart';

class PaymentService{
  PaymentService(){
    StripePayment.setOptions(
      StripeOptions(publishableKey: 'pk_test_9IO9My8W3b8FKrZQz392kiQG00enHFmKTW')
    );
  }
}