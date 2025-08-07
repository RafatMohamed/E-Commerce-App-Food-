import 'package:bloc/bloc.dart';
import 'package:food_app/features/cart/data/cart_model.dart';
import 'package:meta/meta.dart';

import '../../../core/models/product_model.dart';
import '../data/cart_item_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartModel cartModel = CartModel(cartItem: []);
  void addProduct({required ProductModel product}) {
    cartModel.addProduct(product);
    emit(CartAddSuccess());
  }
  void removeProduct({required ProductModel product}) {
    cartModel.removeProduct(product);
    emit(CartRemoveSuccess());
  }
void clearCart() {
    cartModel.clearCart();
    emit(CartClearSuccess());
  }
  void incCount({required ProductModel product}) {
    cartModel.incrementCount(product: product);
    emit(IncCountSuccess());
  }
  void decrementCount({required ProductModel product}) {
    cartModel.decrementCount(product: product);
    emit(DecCountSuccess());
  }

}
