import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../widgets/default_check_box.dart';
import '../../logic/register_cubit.dart';
import '../../logic/register_state.dart';

class RegisterBodyTextForm extends StatelessWidget {
  const RegisterBodyTextForm({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 16,
      children: [
        CustomTextFormField(
          focusNode: cubit.nameFocus,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          hintText: "الاسم كامل",
          obscureText: false,
          onSaved: (name) {
            FocusScope.of(context).requestFocus(cubit.nameFocus);
            cubit.nameController.text = name!;
          },
          controller: cubit.nameController,
        ),
        CustomTextFormField(
          focusNode: cubit.phoneFocus,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          hintText: "رقم الموبايل",
          obscureText: false,
          onSaved: (phone) {
            FocusScope.of(context).requestFocus(cubit.phoneFocus);
            cubit.phoneController.text = phone!;
          },
          controller: cubit.phoneController,
        ),
        CustomTextFormField(
          focusNode: cubit.emailFocus,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          hintText: "البريد الإلكتروني",
          obscureText: false,
          onSaved: (email) {
            FocusScope.of(context).requestFocus(cubit.emailFocus);
            cubit.emailController.text = email!;
          },
          controller: cubit.emailController,
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
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
              suffixIcon: IconButton(
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                      'من خلال إنشاء حساب ، فإنك توافق على ',
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColor.grayscale400,
                      ),
                    ),
                    TextSpan(
                      text: 'الشروط والأحكام',
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColor.green1600,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColor.grayscale600,
                      ),
                    ),
                    TextSpan(
                      text: 'الخاصة بنا',
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColor.green1600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 16),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return DefaultCheckBox(
                  isChecked: cubit.isCheck,
                  onChanged: (value) {
                    cubit.changeCheckedBox(isChecked: value);
                    log("$value");
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}