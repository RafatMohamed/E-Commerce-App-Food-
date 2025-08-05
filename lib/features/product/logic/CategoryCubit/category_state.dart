import '../../../../core/models/category_model.dart';

class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}


final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  CategorySuccess({required this.categories});
}

final class CategoryError extends CategoryState {
  final String errorMessage;
  CategoryError({required this.errorMessage});
}
