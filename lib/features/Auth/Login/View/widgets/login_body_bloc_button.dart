import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../MainView/main_view.dart';
import '../../../SignUp/View/sign_up_view.dart';
import '../../../widgets/have_account_or_not.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginBoBlocButton extends StatelessWidget {
  const LoginBoBlocButton({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;


  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 33,
      children: [
        BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              text: "تسجيل دخول",
              onTap: () {
                if(cubit.formKey.currentState!.validate()){
                  cubit.formKey.currentState!.save();
                  cubit.userLogin(email: cubit.emailController.text,password: cubit.passwordController.text);
                }
              },
            );
          },
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, MainView.routeName);
            }
            if (state is LoginFailure) {
             showSnackBarMessage(context: context, message: state.error);
            }
          },
        ),
        HaveAccountOrNot(
          onPressed: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          text: 'لا تمتلك حسابًا؟ ',
          textButton: 'قم بإنشاء حساب',
        ),
      ],
    );
  }
}
