import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant.dart' ;
import '../../../../../core/service/StorageLocal/shared_prefs.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../Home/View/home_view.dart';
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
              signInOrNot(context);
              Navigator.pushNamed(context, HomeView.routeName);
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
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
  void signInOrNot(BuildContext context) async{
    await PrefsStorage().saveBool(kSignIn, true);
  }
}
