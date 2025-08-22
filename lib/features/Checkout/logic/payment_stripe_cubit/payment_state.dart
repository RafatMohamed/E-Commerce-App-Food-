class PaymentState {}
class InitialPaymentState extends PaymentState{}
class LoadingPaymentState extends PaymentState{}
class SuccessPaymentState extends PaymentState{}
class FailurePaymentState extends PaymentState{
  final String message;
  FailurePaymentState({required this.message});
}