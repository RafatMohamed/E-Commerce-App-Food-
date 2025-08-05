import 'package:dartz/dartz.dart';
import '../../models/category_model.dart';

abstract class CategoryProductRepo {
  Future<Either<String, List<CategoryModel>>> getCategoryProducts();
}