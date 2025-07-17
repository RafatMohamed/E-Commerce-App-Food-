import 'package:food_app/core/models/user_model.dart';

class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState{
  final UserModel userModelAuth;
  RegisterSuccess({required this.userModelAuth});

}
final class RegisterFailure extends RegisterState {
final String error;
RegisterFailure({required this.error});
}

final class RegisterChangePasswordVisibility extends RegisterState {
final bool obsecure;
RegisterChangePasswordVisibility({required this.obsecure});
}
final class IsChecked extends RegisterState {
final bool isChecked;
IsChecked({required this.isChecked});
}


