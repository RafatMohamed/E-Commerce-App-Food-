part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAddSuccess extends CartState {
  CartAddSuccess();
}
final class CartRemoveSuccess extends CartState {
  CartRemoveSuccess();
}
final class IncCountSuccess extends CartState {
  IncCountSuccess();
}
final class DecCountSuccess extends CartState {
  DecCountSuccess();
}
final class CartClearSuccess extends CartState {
  CartClearSuccess();
}
