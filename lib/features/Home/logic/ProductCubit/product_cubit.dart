import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/Home/logic/ProductCubit/product_state.dart';
import '../../../../core/repo/Product_repo/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productRepo}) : super(ProductInitial());
  ProductRepo productRepo;
  int productLength = 0;
  Future<void> fetchProductBestSeller() async {
    emit(ProductLoading());
    var result = await productRepo.getBestSellerProducts();
    result.fold(
      (error) => emit(ProductError(errorMessage: error)),
      (product){
        productLength += product.length;
        emit(ProductSuccess(products: product));
      },
    );
  }
  Future<void> fetchProduct() async {
    emit(ProductLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (error) => emit(ProductError(errorMessage: error)),
      (product) => emit(ProductSuccess(products: product)),
    );
  }
}
