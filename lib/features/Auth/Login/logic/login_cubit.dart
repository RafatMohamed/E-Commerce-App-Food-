import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();

  final FocusNode emailFocus =FocusNode();
  final FocusNode passwordFocus =FocusNode();

  final GlobalKey<FormState> formKey=GlobalKey();
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  bool obscureText=false;

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginRepo loginRepo;
  Future<void> userLogin({required String email,required String password}) async {
    emit(LoginLoading());
    var userLogin = await loginRepo.loginUser(email:email, password: password);
    userLogin.fold(
      (error) => emit(LoginFailure(error: error)),
      (user) => emit(LoginSuccess(userModelAuth:user )),
    );
  }
  Future<void> userLoginWithGoogle() async {
    emit(LoginLoading());
    var userLogin = await loginRepo.loginUserWithGoogleRepo();
    userLogin.fold(
      (error) => emit(LoginFailure(error: error)),
      (user) => emit(LoginSuccess(userModelAuth:user)),
    );
  }
  Future<void> userLoginWithGFacebook() async {
    emit(LoginLoading());
    var userLogin = await loginRepo.loginUserWithFacebookRepo();
    userLogin.fold(
      (error) => emit(LoginFailure(error: error)),
      (user) => emit(LoginSuccess(userModelAuth:user)),
    );
  }
  Future<void> logOutFromGoogle() async {
    emit(LoginLoading());
    var userLogin = await loginRepo.firebaseAuthService.signOutFromGoogle();
   return userLogin;
  }
  void changePasswordVisibility() {
    obscureText =!obscureText;
    emit(LoginChangePasswordVisibility(obsecure: obscureText));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    return super.close();
  }
}
