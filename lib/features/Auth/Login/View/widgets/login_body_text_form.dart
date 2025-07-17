import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginBodyTextForm extends StatelessWidget {
  const LoginBodyTextForm({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 16,
      children: [
        CustomTextFormField(
          focusNode: cubit.emailFocus,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          hintText: "البريد الإلكتروني",
          obscureText: false,
          controller: cubit.emailController,
          onSaved: (email) {
            FocusScope.of(context).requestFocus(cubit.emailFocus);
            cubit.emailController.text = email!;
          },
        ),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return CustomTextFormField(
              focusNode: cubit.passwordFocus,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              hintText: "كلمة المرور",
              obscureText: cubit.obscureText,
              controller: cubit.passwordController,
              onSaved: (password) {
                FocusScope.of(context).requestFocus(cubit.passwordFocus);
                cubit.passwordController.text = password!;
              },
              suffixIcon:IconButton(
                onPressed: () {
                  cubit.changePasswordVisibility();
                },
                icon:
                cubit.obscureText
                    ? const Icon(
                  Icons.visibility_outlined,
                )
                    : const Icon(
                  Icons.visibility_off_outlined,
                ),
              ),
            );
          },
        ),
        Text(
          'نسيت كلمة المرور؟',
          style: TextStyles.semiBold13.copyWith(
            color: AppColor.green1600,
          ),
        ),
      ],
    );
  }
}
