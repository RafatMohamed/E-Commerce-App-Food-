import 'package:food_app/core/repo/Categry_repo/category_product_repo_imp.dart';
import 'package:food_app/core/repo/Product_repo/product_repo_imp.dart';
import 'package:food_app/core/service/Firebase_service/data_base_service.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';
import 'package:food_app/features/Auth/Login/data/login_repo.dart';
import 'package:food_app/features/Auth/Login/logic/login_cubit.dart';
import 'package:food_app/features/Checkout/data/repo/order_repo.dart';
import 'package:food_app/features/Checkout/data/repo/order_repo_imp.dart';
import 'package:food_app/features/Checkout/logic/order_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/SignUp/data/repo.dart';
import '../../features/Auth/SignUp/logic/register_cubit.dart';
import '../repo/Categry_repo/category_product_repo.dart';
import '../repo/Product_repo/product_repo.dart';
import 'Firebase_service/fire_store_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<DataBaseService>(FireStoreService());

  getIt.registerSingleton<LoginRepo>(LoginRepo(
    fireStoreService: getIt.get<DataBaseService>(),
    firebaseAuthService: getIt.get<FirebaseAuthService>(),
  ));

  getIt.registerSingleton<RegisterRepo>(RegisterRepo(
    fireStore: getIt.get<DataBaseService>(),
    firebaseAuthService: getIt.get<FirebaseAuthService>(),
  ));

  getIt.registerSingleton<LoginCubit>(
    LoginCubit(loginRepo: getIt.get<LoginRepo>()),
  );

  getIt.registerSingleton<RegisterCubit>(
    RegisterCubit(registerRepo: getIt.get<RegisterRepo>()),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImp(
      dataBaseService: getIt.get<DataBaseService>(),
    ),
  );
  getIt.registerSingleton<CategoryProductRepo>(
    CategoryProductRepoImp(
      dataBaseService: getIt.get<DataBaseService>(),
    ),
  );
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImp(
      dataBaseServiceFireSt: getIt.get<DataBaseService>(),
    ),
  );
  getIt.registerSingleton<OrderCubit>(
      OrderCubit(
          orderRepo: getIt.get<OrderRepo>(),
      )
  );
}
