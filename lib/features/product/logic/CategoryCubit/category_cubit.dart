import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repo/Categry_repo/category_product_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState > {
  CategoryCubit({required this.categoryProductRepo}) : super(CategoryInitial());
  CategoryProductRepo categoryProductRepo;
  int productLength = 0;

  Future<void> fetchCategoryProduct() async {
    emit(CategoryLoading());
    var result = await categoryProductRepo.getCategoryProducts();
    result.fold(
      (error) => emit(CategoryError(errorMessage: error)),
      (category) => emit(CategorySuccess(categories: category)),
    );
  }
}
