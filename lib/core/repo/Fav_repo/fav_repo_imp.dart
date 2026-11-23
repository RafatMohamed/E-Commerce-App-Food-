import 'package:dartz/dartz.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/models/product_model.dart';
import 'package:food_app/core/repo/Fav_repo/fav_repo.dart';
import 'package:food_app/core/service/Firebase_service/data_base_service.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';

class FavRepoImp implements FavRepo {
  final DataBaseService dataBaseService;
  final FirebaseAuthService firebaseAuthService;

  FavRepoImp({
    required this.dataBaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<String, List<ProductModel>>> getFavProducts() async {
    if (!firebaseAuthService.isSignIn()) {
      return const Left("سجل الدخول الأول عشان تشوف المفضلة");
    }
    try {
      final data = await dataBaseService.getSubCollectionData(
        collectionName: kCollectionUserModel,
        docId: firebaseAuthService.getUser(),
        subCollectionName: kSubCollectionFavourites,
      );
      final List<ProductModel> list = data
          .map((e) => ProductModelInitial.fromJson(e).toEntity())
          .toList();
      return Right(list);
    } catch (e) {
      return Left("failed to get favourites ${e.toString()}");
    }
  }

  @override
  Future<Either<String, Unit>> addFavProduct({
    required ProductModel product,
  }) async {
    if (!firebaseAuthService.isSignIn()) {
      return const Left("سجل الدخول الأول عشان تضيف للمفضلة");
    }
    try {
      await dataBaseService.setSubCollectionDocData(
        collectionName: kCollectionUserModel,
        docId: firebaseAuthService.getUser(),
        subCollectionName: kSubCollectionFavourites,
        subDocId: product.code,
        data: product.toJson(),
      );
      return const Right(unit);
    } catch (e) {
      return Left("failed to add favourite ${e.toString()}");
    }
  }

  @override
  Future<Either<String, Unit>> removeFavProduct({
    required String productCode,
  }) async {
    if (!firebaseAuthService.isSignIn()) {
      return const Left("سجل الدخول الأول");
    }
    try {
      await dataBaseService.deleteSubCollectionDoc(
        collectionName: kCollectionUserModel,
        docId: firebaseAuthService.getUser(),
        subCollectionName: kSubCollectionFavourites,
        subDocId: productCode,
      );
      return const Right(unit);
    } catch (e) {
      return Left("failed to remove favourite ${e.toString()}");
    }
  }
}
