// import 'package:dartz/dartz.dart';
// import 'package:food_app/core/constant.dart';
// import 'package:food_app/core/models/product_model.dart';
// import 'package:food_app/core/repo/Product_repo/category_product_repo.dart';
//
// import '../../service/Firebase_service/data_base_service.dart';
//
// class ProductRepoImp extends ProductRepo {
//   final DataBaseService dataBaseService;
//   ProductRepoImp({required this.dataBaseService});
//   @override
//   Future<Either<String, List<ProductModel>>> getBestSellerProducts() async {
//     try {
//       var data = await dataBaseService.getData(
//         collectionName: kCollectionProductModel,
//         query: {'limit': 10, 'orderBy': 'quantity', 'descending': true},
//       );
//       List<ProductModel> list =
//           data.map((e) => ProductModelInitial.fromJson(e).toEntity()).toList();
//       return Right(list);
//     } catch (e) {
//       return Left("failed to get best seller products ${e.toString()}");
//     }
//   }
//
//   @override
//   Future<Either<String, List<ProductModel>>> getProducts() async {
//     try {
//       var data = await dataBaseService.getData(
//         collectionName: kCollectionProductModel,
//       );
//       List<ProductModel> list =
//           data.map((e) => ProductModelInitial.fromJson(e).toEntity()).toList();
//       return Right(list);
//     } catch (e) {
//       return Left("failed to get products ${e.toString()}");
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/core/repo/Product_repo/product_repo.dart';

import '../../service/Firebase_service/data_base_service.dart';

class ProductRepoImp extends ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImp({required this.dataBaseService});

  @override
  Future<Either<String, List<ProductModel>>> getBestSellerProducts() async {
    try {
      var data = await dataBaseService.getData(
        collectionName: kCollectionProductModel,
        query: {'limit': 10, 'orderBy': 'quantity', 'descending': true},
      );
      List<ProductModel> list = (data as List)
          .map((e) => ProductModelInitial.fromJson(e).toEntity())
          .toList();
      return Right(list);
    } catch (e) {
      return Left("failed to get best seller products ${e.toString()}");
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(
        collectionName: kCollectionProductModel,
      );
      List<ProductModel> list = (data as List)
          .map((e) => ProductModelInitial.fromJson(e).toEntity())
          .toList();
      return Right(list);
    } catch (e) {
      return Left("failed to get products ${e.toString()}");
    }
  }
}

