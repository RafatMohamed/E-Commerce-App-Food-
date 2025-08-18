import 'package:dartz/dartz.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';

abstract class OrderRepo{
  Future<Either<String,void>> addOrder({required OrderModel order});
}