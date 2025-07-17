import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/core/models/user_model.dart';

Future<UserModel> getUserDataFromFirestore(String uid) async {
  final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  final data = doc.data()!;
  return UserModel(
    name: data['name'],
    email: data['email'],
    id: uid,
    phoneNumer: data['phoneNumber'],
  );
}
