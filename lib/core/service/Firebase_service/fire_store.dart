import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constant.dart';
import 'package:food_app/core/models/user_model.dart';

class FireStoreService{
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;
  Future<void> setUserData({required String collectionName,required String path,required Map<String,dynamic> data})async
  {
  await fireStore.collection(collectionName).doc(path).set(data,SetOptions(merge: true));
  }
  Future<Map<String,dynamic>?> getUserData({required String collectionName,required String path})async
  {
 final userData= await fireStore.collection(collectionName).doc(path).get();
 return userData.data()!;
  }

  Future<UserModel> getUserDataFromFireStore(String uid) async {
    final data = await getUserData(collectionName: kCollectionUserModel, path: uid);
    if (data == null) {
      throw Exception('User with UID $uid not found');
    }
    return UserModel(
      name: data['name'],
      email: data['email'],
      id: uid,
      phoneNumer: data['phoneNumber'],
    );
  }

}