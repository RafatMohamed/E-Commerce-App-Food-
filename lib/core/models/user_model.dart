import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String id;
  final String phoneNumber;
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.phoneNumber,
  });
}

class UserModelInfo extends UserModel {
  UserModelInfo({
    required super.email,
    required super.name,
    required super.id,
    required super.phoneNumber,
  });

  factory UserModelInfo.fromFirebaseUser(User user) {
    return UserModelInfo(
      email: user.email ?? '',
      name: user.displayName ?? '',
      id: user.uid,
      phoneNumber: user.phoneNumber ?? '',
    );
  }
  toMap() {
    return {'name': name, 'email': email, 'phoneNumber': phoneNumber, 'uid': id};
  }
  factory UserModelInfo.fromMap(Map<String, dynamic> map) {
    return UserModelInfo(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      id: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }
}
