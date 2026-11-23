import 'package:dartz/dartz.dart';
import 'package:food_app/core/models/product_model.dart';

abstract class FavRepo {
  Future<Either<String, List<ProductModel>>> getFavProducts();
  Future<Either<String, Unit>> addFavProduct({required ProductModel product});
  Future<Either<String, Unit>> removeFavProduct({required String productCode});
}
