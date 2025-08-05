import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/models/user_model.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';
import '../../../../core/constant.dart';
import '../../../../core/error/handel_error.dart';
import '../../../../core/service/Firebase_service/data_base_service.dart';


class RegisterRepo{
  RegisterRepo({required this.fireStore, required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;
  final DataBaseService fireStore;

  final FirebaseAuth auth=FirebaseAuth.instance;


  Future<Either<String, UserModel>> registerUser({required String email, required String password, required String name, required String phoneNumber}) async {
    try {
    final user = await firebaseAuthService.signUp(emailAddress: email, password: password);
    await user.updateDisplayName(name);
    final Map<String,dynamic> userData={
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': user.uid,
    };
      await fireStore.setData(path: user.uid, data: userData, collectionName: kCollectionUserModel);
      return right(UserModelInfo.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    } catch (e) {
      return left(e.toString());
    }
  }
}