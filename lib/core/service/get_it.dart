import 'package:food_app/features/Auth/Login/data/login_repo.dart';
import 'package:food_app/features/Auth/Login/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/SignUp/data/repo.dart';
import '../../features/Auth/SignUp/logic/register_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LoginRepo>(LoginRepo());
  getIt.registerSingleton<RegisterRepo>(RegisterRepo());
  getIt.registerSingleton<LoginCubit>(
    LoginCubit(loginRepo: getIt.get<LoginRepo>()),
  );
  getIt.registerSingleton<RegisterCubit>(
    RegisterCubit(registerRepo: getIt.get<RegisterRepo>()),
  );
}
