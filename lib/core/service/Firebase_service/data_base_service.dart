
import 'package:food_app/core/models/user_model.dart';

abstract class DataBaseService{
  Future<void> setData({required String collectionName,required String path,required Map<String,dynamic> data});
  Future<dynamic> getData({required String collectionName,String? path,Map<String,dynamic>? query});
  Future<UserModel> getUserDataFromFireStore(String uid);
}