import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/models/user_model.dart';
import '../../../../core/error/handel_error.dart';

class LoginRepo{
  Future <Either<String,UserModel>> loginUser({required String email,required String password}) async {
    try {
      final credential=  await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return Right(UserModelInfo.fromFirebaseUser(credential.user!));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }
}