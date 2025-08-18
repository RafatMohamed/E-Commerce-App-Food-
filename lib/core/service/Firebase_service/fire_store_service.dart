import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constant.dart';
import 'package:food_app/core/models/user_model.dart';

import 'data_base_service.dart';

 class FireStoreService implements DataBaseService{
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;

  @override
    Future<dynamic> getData({required String collectionName, String? path,Map<String,dynamic>? query})async
   {
     if(path!=null){
       final snapshot = await fireStore.collection(collectionName).doc(path).get();
       if (!snapshot.exists || snapshot.data() == null) {
         return null;
       }
       return snapshot.data();
     }else {
       Query<Map<String, dynamic>> data =  fireStore.collection(collectionName);
       if (query != null) {
         if (query['orderBy'] != null) {
           var orderByField = query['orderBy'];
           var descending = query['descending'];
           data = data.orderBy(orderByField, descending: descending);
         }
         if (query['limit'] != null) {
           var limit = query['limit'];
           data = data.limit(limit);
         }
       }
       var result = await data.get();
       return result.docs.map((e) => e.data()).toList();
     }
   }


  @override
  Future<void> setData({required String collectionName,required String path,required Map<String,dynamic> data})async
  {
  await fireStore.collection(collectionName).doc(path).set(data,SetOptions(merge: true));
  }


  @override
  Future<UserModel> getUserDataFromFireStore(String uid) async {
    final data = await getData(collectionName: kCollectionUserModel, path: uid);
    if (data == null) {
      throw Exception('User with UID $uid not found');
    }
    return UserModel(
      name: data['name'],
      email: data['email'],
      id: uid,
      phoneNumber: data['phoneNumber'],
    );
  }

  @override
  Future<void> setSubCollectionData({
    required String collectionName,required String subCollectionName,required String path,required Map<String,dynamic> data})async{
    await fireStore
        .collection(collectionName)
        .doc(path)
        .collection(subCollectionName)
        .doc()
        .set(data);
  }

 }