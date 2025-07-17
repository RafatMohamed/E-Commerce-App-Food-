import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  final String name;
  final String email;
  final String id;
  final String phoneNumer;
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.phoneNumer

});
}
class UserModelInfo extends UserModel {
  UserModelInfo({required super.email, required super.name, required super.id, required super.phoneNumer});

  factory UserModelInfo.fromFirebaseUser(User user){
    return UserModelInfo(
        email: user.email?? '',
        name: user.displayName??'',
        id: user.uid,
        phoneNumer: user.phoneNumber??''
    );
}
}