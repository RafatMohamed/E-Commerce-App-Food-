import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/images.dart';
import '../../../SignUp/View/saveInfoAuth/save_phone.dart';
import '../../../widgets/default_login_media.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginBodySocial extends StatelessWidget {
  const LoginBodySocial({super.key, required this.size, required this.cubit});

  final Size size;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SizedBox(
          height: 31,
          child: Stack(
            children: [
              const Divider(color: Color(0xffDDDFDF), thickness: 1),
              Positioned(
                left: size.width / 2 - 55,
                right: size.width / 2 - 55,
                child: Container(
                  width: 55,
                  color: Colors.white,
                  child: const Center(
                    child: Text("أو", style: TextStyles.semiBold16),
                  ),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return DefaultLoginMedia(
              text: 'تسجيل بواسطة جوجل',
              logoIcon: Assets.imagesGoogleIcon,
              onPressed: () {
              final userLoginWithGoogle =  cubit.userLoginWithGoogle(context: context);
              // if(userLoginWithGoogle != null){
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return const PhoneNumberFormPage();
              //       },
              //     ),
              //   );
              // }else{
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text("فشل تسجيل الدخول بحساب جوجل")),
              //   );
              // }
              //   if (cubit.phoneController.text == '' ||
              //       cubit.phoneController.text.isEmpty ||
              //       cubit.phoneController.text == null) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text("يرجى ادخال رقم الموبايل")),
              //     );
              //   }
              },
            );
          },
        ),
        DefaultLoginMedia(
          text: 'تسجيل بواسطة أبل',
          logoIcon: Assets.imagesApplIcon,
          onPressed: () {},
        ),
        DefaultLoginMedia(
          text: 'تسجيل بواسطة فيسبوك',
          logoIcon: Assets.imagesFacebookIcon,
          onPressed: () {
            cubit.userLoginWithGFacebook();
          },
        ),
      ],
    );
  }
}
