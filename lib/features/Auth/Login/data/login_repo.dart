import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';
import '../../../../core/error/handel_error.dart';
import '../../../../core/models/user_model.dart';

class LoginRepo{
  LoginRepo({required this.firebaseAuthService});
  final FirebaseAuthService firebaseAuthService;
  Future <Either<String,UserModel>> loginUser({required String email,required String password}) async {
    try {
      final user=await firebaseAuthService.signIn(emailAddress: email, password: password);
      return Right(UserModelInfo.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }

  Future <Either<String,UserModel>> loginUserWithGoogleRepo() async {
    try {
     var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModelInfo.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }
  Future <Either<String,UserModel>> loginUserWithFacebookRepo() async {
    try {
     var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModelInfo.fromFirebaseUser(user.user!));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }



}