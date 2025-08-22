import 'package:dartz/dartz.dart';

import '../../Model/strip_model/model/payment_inpur_model.dart';

abstract class PaymentStripeRepo {
  Future<Either<String ,void>> confirmPaymentSheet({required PaymentInputModel paymentInputModel});
}