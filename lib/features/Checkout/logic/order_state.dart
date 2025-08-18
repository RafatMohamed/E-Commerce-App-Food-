part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderLoading extends OrderState {}
final class OrderFailed extends OrderState {
  final String errorMsg;
  OrderFailed({required this.errorMsg});
}
final class OrderSuccess extends OrderState {}
