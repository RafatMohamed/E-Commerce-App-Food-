import 'package:bloc/bloc.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/data/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderRepo orderRepo;
  OrderCubit({required this.orderRepo}) : super(OrderInitial());
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
}
