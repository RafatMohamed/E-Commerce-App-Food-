import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/Checkout/logic/payment_stripe_cubit/payment_state.dart';

import '../../data/Model/strip_model/model/payment_inpur_model.dart';
import '../../data/repo/Payment Stripe Repo/payment_stripe_repo.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(InitialPaymentState());
  PaymentStripeRepo paymentRepo;
  PaymentCubit get(context) => BlocProvider.of(context);
  Future<void> confirmPaymentSheet({
    required PaymentInputModel paymentInputModel,
  }) async {
    emit(LoadingPaymentState());
    var result = await paymentRepo.confirmPaymentSheet(
      paymentInputModel: paymentInputModel,
    );
    result.fold(
      (String error) => emit(FailurePaymentState(message: error)),
      (r) => emit(SuccessPaymentState()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    print(change);
    super.onChange(change);
  }
}
