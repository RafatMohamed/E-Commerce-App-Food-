import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/Auth/Login/View/login_view.dart';
import 'package:food_app/features/Auth/SignUp/logic/register_cubit.dart';
import 'package:food_app/features/Auth/SignUp/logic/register_state.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../SignUp/View/tets/test.dart';
import '../../../widgets/have_account_or_not.dart';

class RegisterBodyBlocButton extends StatelessWidget {
  const RegisterBodyBlocButton({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;


  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 33,
      children: [
        BlocConsumer<RegisterCubit, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              text: "إنشاء حساب جديد",
              onTap: () {
                if(cubit.formKey.currentState!.validate()){
                  cubit.formKey.currentState!.save();
                  cubit.userRegister(phoneNumer: cubit.phoneController.text,name: cubit.nameController.text,email: cubit.emailController.text,password: cubit.passwordController.text);
                }
              },
            );
          },
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TestLogin();
                  },
                ),
              );
            }
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
        ),
        HaveAccountOrNot(
          onPressed: () {
            Navigator.pushNamed(
              context,
              LoginView.routeName,
            );
          },
          text:"  تمتلك حساب بالفعل؟ ",
          textButton: "تسجيل دخول",
        ),
      ],
    );
  }
}
