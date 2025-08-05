import 'package:dartz/dartz.dart';
import 'package:food_app/core/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, List<ProductModel>>> getBestSellerProducts();
}