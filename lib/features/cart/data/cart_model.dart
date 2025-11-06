import 'package:food_app/features/cart/data/cart_item_model.dart';

import '../../../core/models/product_model.dart';

class CartModel {
  final List<CartItemModel> cartItem;
  CartModel({required this.cartItem});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartItem: (json['cartItem'] as List<dynamic>? ?? [])
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartItem': cartItem.map((e) => e.toJson()).toList(),
    };
  }
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
    final index = cartItem.indexWhere((element) => element.productModel.code == product.code);

    if (index != -1) {
      return cartItem[index].incrementCount();
    } else {
      cartItem.add(CartItemModel(productModel: product, count: 1));
      return 1;
    }
  }

  num decrementCount({required ProductModel product}) {
    final index = cartItem.indexWhere((element) => element.productModel.code == product.code);

    if (index != -1) {
      final newCount = cartItem[index].decrementCount();
      if (newCount <= 0) {
        cartItem.removeAt(index);
      }
      return newCount;
    }
    return 0;
  }

  num getCount({required ProductModel product}) {
    final item = cartItem.firstWhere(
          (element) => element.productModel.code == product.code,
      orElse: () => CartItemModel(productModel: product, count: 0),
    );
    return item.count;
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

