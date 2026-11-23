import '../../../../core/models/product_model.dart';

class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  ProductSuccess({required this.products});
}
final class ProductError extends ProductState {
  final String errorMessage;
  ProductError({required this.errorMessage});
}

final class ProductFavSuccess extends ProductState {
  final List<ProductModel> products;
  ProductFavSuccess({required this.products});
}
final class ProductFavError extends ProductState {
  final String errorMessage;
  ProductFavError({required this.errorMessage});
}
