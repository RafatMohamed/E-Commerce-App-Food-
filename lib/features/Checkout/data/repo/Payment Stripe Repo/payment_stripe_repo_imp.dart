import 'package:dartz/dartz.dart';
import 'package:food_app/features/Checkout/data/repo/Payment%20Stripe%20Repo/payment_stripe_repo.dart';
import '../../../../../core/service/strip_service.dart';
import '../../Model/strip_model/model/payment_inpur_model.dart';

class PaymentStripeRepoImp extends PaymentStripeRepo {
 final StripeService stripeService;
  PaymentStripeRepoImp({required this.stripeService});
  @override
  Future<Either<String ,void>> confirmPaymentSheet({required PaymentInputModel paymentInputModel}) async {
    try{
      await stripeService.confirmPaymentSheet(paymentInputModel: paymentInputModel);
      return const Right(null);
    }
    catch(e){
      return Left(e.toString());
    }
  }
}