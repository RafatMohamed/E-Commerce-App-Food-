import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/features/cart/data/cart_model.dart';

class CartItemModel{
  final ProductModel productModel;
  int count;
  CartModel cartModel=CartModel(cartItem: []);
  CartItemModel({required this.productModel,this.count=0});

  int incrementCount(){
  return  count++;
  }

  int decrementCount(){
   return count--;
  }
  num calculateTotalPriceItem(){
    if(count==0){
      return 0;
    }
    return productModel.price*count;
  }

  num getTotalCount(){
    return count;
  }
  num calculateTotalPrice(){
    return productModel.price*count*cartModel.cartItem.length;
  }
  num calculateTotalQuantity(){
    return productModel.weight_grams_per_unit*count;
  }
  num calculateTotalCalories(){
    return productModel.calories*count;
  }
}