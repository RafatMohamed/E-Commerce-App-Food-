import 'package:dartz/dartz.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/service/Firebase_service/data_base_service.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/data/repo/order_repo.dart';

class OrderRepoImp extends OrderRepo{
  DataBaseService dataBaseServiceFireSt;
  OrderRepoImp({required this.dataBaseServiceFireSt}) ;
  @override
  Future<Either<String, void>> addOrder({required OrderModel order})async {
    try{
      var data = OrderModelInitial.fromEntity(order).toJson();
    var result=   await dataBaseServiceFireSt.setSubCollectionData(collectionName:kOrderProduct ,subCollectionName: "userOrders", path: order.userId, data:data);
    return Right(result);
    }catch(e){
     return Left("faield to add order ${e.toString()}");
    }
  }
  
}