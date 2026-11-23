import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/core/repo/Fav_repo/fav_repo.dart';

import 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit({required this.favRepo}) : super(FavInitial());

  final FavRepo favRepo;

  List<ProductModel> favProducts = [];

  bool isFav(String productCode) =>
      favProducts.any((product) => product.code == productCode);

  Future<void> fetchFavs() async {
    emit(FavLoading());
    final result = await favRepo.getFavProducts();
    result.fold(
      (error) => emit(FavError(errorMessage: error)),
      (products) {
        favProducts = products;
        emit(FavSuccess());
      },
    );
  }

  /// Toggles the product in the signed-in user's favourites.
  /// Returns null on success, or the error message on failure.
  Future<String?> toggleFav(ProductModel product) async {
    final bool wasFav = isFav(product.code);
    if (wasFav) {
      favProducts.removeWhere((element) => element.code == product.code);
    } else {
      favProducts.add(product);
    }
    emit(FavSuccess());

    final result = wasFav
        ? await favRepo.removeFavProduct(productCode: product.code)
        : await favRepo.addFavProduct(product: product);

    return result.fold(
      (error) {
        if (wasFav) {
          favProducts.add(product);
        } else {
          favProducts.removeWhere((element) => element.code == product.code);
        }
        emit(FavError(errorMessage: error));
        return error;
      },
      (_) => null,
    );
  }
}
