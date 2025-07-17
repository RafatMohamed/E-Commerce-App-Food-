import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/models/user_model.dart';
import '../../../../core/constant.dart';
import '../../../../core/error/handel_error.dart';


class RegisterRepo{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;
  Future<Either<String, UserModel>> registerUser({required String email, required String password, required String name, required String phoneNumer}) async {
    try {
    final credential =  await auth.createUserWithEmailAndPassword(
        email: email,
        password:password,
      );
    await credential.user!.updateDisplayName(name);

    await fireStore.collection(kCollectionUserModel).doc(auth.currentUser!.uid).set({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumer,
      'uid': auth.currentUser!.uid,
    });
      return right(UserModelInfo.fromFirebaseUser(credential.user!));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    } catch (e) {
      return left(e.toString());
    }
  }
}