import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../logic/login_cubit.dart';
import 'login_body_bloc_button.dart';
import 'login_body_social.dart';
import 'login_body_text_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
    required this.cubit,
    required this.size,
  });

  final LoginCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
        isRegister: false,
        context: context,
        title: "تسجيل دخول",
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  LoginBodyTextForm(cubit: cubit),
                  const SizedBox(height: 66),
                  LoginBoBlocButton(cubit: cubit),
                  const SizedBox(height: 33),
                  LoginBodySocial(size: size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}