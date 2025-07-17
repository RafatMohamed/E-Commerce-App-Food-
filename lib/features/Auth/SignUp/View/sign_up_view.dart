import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/Auth/SignUp/View/widgets/register_view_body.dart';
import 'package:food_app/features/Auth/SignUp/data/repo.dart';
import 'package:food_app/features/Auth/SignUp/logic/register_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const String routeName = "SignUp";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => RegisterCubit(registerRepo: RegisterRepo()),
      child: Builder(
        builder: (context) {
          final cubit = RegisterCubit.get(context);
          return RegisterViewBody(cubit: cubit,size:  size);
        },
      ),
    );
  }
}

