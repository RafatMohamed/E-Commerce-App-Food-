import 'package:flutter/material.dart';
import 'package:food_app/features/Auth/SignUp/View/widgets/register_body_bloc_button.dart';
import 'package:food_app/features/Auth/SignUp/View/widgets/register_body_text_form.dart';
import '../../../../../core/constant.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../logic/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
    required this.cubit,
    required this.size,
  });

  final RegisterCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarRegister.customAppBar(
        isRegister: true,
        context: context,
        title: "حساب جديد",
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
                  RegisterBodyTextForm(cubit: cubit),
                  const SizedBox(height: 66),
                  RegisterBodyBlocButton(cubit: cubit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




