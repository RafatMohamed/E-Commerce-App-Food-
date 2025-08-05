import 'package:dartz/dartz.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/models/category_model.dart';
import '../../service/Firebase_service/data_base_service.dart';
import 'category_product_repo.dart';

class CategoryProductRepoImp extends CategoryProductRepo {
  final DataBaseService dataBaseService;

  CategoryProductRepoImp({required this.dataBaseService});
  @override
  Future<Either<String, List<CategoryModel>>> getCategoryProducts() async{
    try {
      var data = await dataBaseService.getData(
        collectionName: kCollectionCategoryProductModel,
      );
      List<CategoryModel> list = (data as List)
          .map((e) => CategoryModelInitial.fromJson(e).toEntity())
          .toList();
      return Right(list);
    } catch (e) {
      return Left("failed to get products ${e.toString()}");
    }
  }
}

