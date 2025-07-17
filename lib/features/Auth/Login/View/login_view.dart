import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/service/get_it.dart';
import 'package:food_app/features/Auth/Login/View/widgets/login_view_body.dart';
import 'package:food_app/features/Auth/Login/data/login_repo.dart';
import 'package:food_app/features/Auth/Login/logic/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "Login";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => LoginCubit(
        loginRepo: getIt<LoginRepo>(),
      ),
      child: Builder(
        builder: (context) {
          final cubit = LoginCubit.get(context);
          return LoginViewBody(cubit: cubit, size: size);
        },
      ),
    );
  }
}




