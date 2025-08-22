import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/data/repo/order_repo.dart';
import 'package:meta/meta.dart';

import '../data/Model/strip_model/model/payment_inpur_model.dart';
import '../data/repo/Payment Stripe Repo/payment_stripe_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderRepo orderRepo;
  PaymentStripeRepo paymentRepo;
  OrderCubit({required this.orderRepo,required this.paymentRepo}) : super(OrderInitial());
  Future<void> addOrder({required OrderModel order}) async {
    emit(OrderLoading());
    var result = await orderRepo.addOrder(order: order);
    result.fold(
      (l) {
        emit(OrderFailed(errorMsg: l));
      },
      (r) {
        emit(OrderSuccess());
      },
    );
  }
  Future<OrderState> confirmPaymentSheetByStripe({
    required PaymentInputModel paymentInputModel,
  }) async {
    emit(OrderLoading());
    var result = await paymentRepo.confirmPaymentSheet(
      paymentInputModel: paymentInputModel,
    );
   return result.fold(
          (String error){
            emit(OrderFailed(errorMsg: error));
            log(error);
            return OrderFailed(errorMsg: error);
          } ,
          (r){
            emit(OrderSuccess());
            return OrderSuccess();
          },
    );
  }
}
