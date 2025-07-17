
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/models/user_model.dart';

class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final UserModel userModelAuth;
  LoginSuccess({required this.userModelAuth});
}
final class LoginFailure extends LoginState {
 final String error;
 LoginFailure({required this.error});
}
final class LoginChangePasswordVisibility extends LoginState {
  final bool obsecure;
  LoginChangePasswordVisibility({required this.obsecure});
}


