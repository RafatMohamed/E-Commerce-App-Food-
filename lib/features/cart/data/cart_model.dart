import 'package:food_app/features/cart/data/cart_item_model.dart';

import '../../../core/models/product_model.dart';

class CartModel {
  final List<CartItemModel> cartItem;
  CartModel({required this.cartItem});

  void addProduct(ProductModel product) {
    if (cartItem.any((element) => element.productModel.code == product.code)) {
      cartItem.firstWhere((element) => element.productModel.code == product.code).incrementCount();
      return;
    }
    cartItem.add(CartItemModel(productModel: product,count: 1));
  }

  void removeProduct(ProductModel product) {
    cartItem.removeWhere((element) => element.productModel.code == product.code);
  }
  num incrementCount({required ProductModel product}) {
   return cartItem[cartItem.indexWhere((element) => element.productModel.code == product.code)].incrementCount();
  }
  num decrementCount({required ProductModel product}) {
   return cartItem[cartItem.indexWhere((element) => element.productModel.code == product.code)].decrementCount();
  }
  num getCount({required ProductModel product}) {
   return cartItem.firstWhere((element) => element.productModel.code == product.code).count;
  }
  void clearCart(){
    cartItem.clear();
  }
  num claculateTotalprice(){
    if(cartItem.isEmpty){
      return 0;
    }
    return cartItem.map((e) => e.calculateTotalPriceItem()).reduce((value, element) => value+element);
  }
}

