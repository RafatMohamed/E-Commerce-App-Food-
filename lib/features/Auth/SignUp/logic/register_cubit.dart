import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/Auth/SignUp/logic/register_state.dart';
import '../data/repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController nameController =TextEditingController();
  final TextEditingController phoneController =TextEditingController();

  final FocusNode nameFocus=FocusNode();
  final FocusNode emailFocus =FocusNode();
  final FocusNode passwordFocus =FocusNode();
  final FocusNode phoneFocus =FocusNode();

  final GlobalKey<FormState> formKey=GlobalKey();
  final AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  bool obscureText=false;
  bool isCheck = false;



  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterRepo registerRepo;

  Future<void> userRegister({required String email, required String password, required String name, required String phoneNumer}) async {
    emit(RegisterLoading());
    var userRegister = await registerRepo.registerUser(
      email: email,
      password: password,
      name: name,
      phoneNumer: phoneNumer,
    );
    userRegister.fold(
      (error) => emit(RegisterFailure(error: error)),
      (user) => emit(RegisterSuccess(userModelAuth: user)),
    );
  }

  void changePasswordVisibility() {
    obscureText = !obscureText;
    emit(RegisterChangePasswordVisibility(obsecure:obscureText));
  }
  void changeCheckedBox({required bool isChecked}) {
    isCheck = isChecked;
    emit(IsChecked(isChecked:isCheck));
  }


  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    phoneFocus.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    return super.close();
  }
}
