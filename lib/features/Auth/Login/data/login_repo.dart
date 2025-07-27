import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/service/Firebase_service/fire_store.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';
import '../../../../core/error/handel_error.dart';
import '../../../../core/models/user_model.dart';

class LoginRepo {
  LoginRepo({
    required this.fireStoreService,
    required this.firebaseAuthService,
  });

  final FirebaseAuthService firebaseAuthService;
  final FireStoreService fireStoreService;
  Future<Either<String, UserModel>> savePhoneNumber({required String phoneNumber}) async {
    try {
      final user =  FirebaseAuth.instance.currentUser;
      if (user == null) {
        return const Left("No user is currently logged in.");
      }
      // Save the phone number manually to Firestore
      await fireStoreService.setUserData(
        collectionName: kCollectionUserModel,
        path: user.uid,
        data: {
          'phoneNumber': phoneNumber,
        },
      );

      // Re-fetch user data from Firestore
      final userData = await fireStoreService.getUserData(
        collectionName: kCollectionUserModel,
        path: user.uid,
      );

      if (userData == null) {
        return const Left("Failed to fetch updated user data.");
      }

      return Right(UserModelInfo.fromMap(userData));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signIn(
        emailAddress: email,
        password: password,
      );
      final userData = await fireStoreService.getUserData(
        collectionName: kCollectionUserModel,
        path: user.uid,
      );
      log(userData!.toString());
      return Right(UserModelInfo.fromMap(userData));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }

  // Future<Either<String, UserModel>> loginUserWithGoogleRepo({
  //   required BuildContext context,
  // }) async {
  //   try {
  //     var user = await firebaseAuthService.signInWithGoogle();
  //     if (user.uid.isEmpty ||user.uid == null) {
  //       log("User: uid=${user.uid}, email=${user.email}, name=${user.displayName}, phone=${user.phoneNumber}");
  //       await fireStoreService.setUserData(
  //         collectionName: kCollectionUserModel,
  //         path: user.uid,
  //         data: UserModelInfo.fromFirebaseUser(user).toMap(),
  //       );
  //     } else {
  //       log("User: uid=${user.uid}, email=${user.email}, name=${user.displayName}, phone=${user.phoneNumber}");
  //       await fireStoreService.getUserData(
  //         collectionName: kCollectionUserModel,
  //         path: user.uid,
  //       );
  //     }
  //      return Right(UserModelInfo.fromFirebaseUser(user));
  //   } on FirebaseAuthException catch (e) {
  //     return Left(getErrorMessage(e));
  //   }
  // }
  Future<Either<String, UserModel?>> loginUserWithGoogleRepo({
    required BuildContext context,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();

      final userData = await fireStoreService.getUserData(
        collectionName: kCollectionUserModel,
        path: user!.uid,
      );

      late UserModelInfo userModel;

      if (userData == null) {
        userModel = UserModelInfo.fromFirebaseUser(user);
        await fireStoreService.setUserData(
          collectionName: kCollectionUserModel,
          path: user.uid,
          data: userModel.toMap(),
        );
      } else
      {
        userModel = UserModelInfo.fromMap(userData);
      }
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }


  Future<Either<String, UserModel>> loginUserWithFacebookRepo() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      final userModel = (UserModelInfo.fromFirebaseUser(user.user!));
      await fireStoreService.setUserData(
        collectionName: kCollectionUserModel,
        path: user.user!.uid,
        data: userModel.toMap(),
      );
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }
}

