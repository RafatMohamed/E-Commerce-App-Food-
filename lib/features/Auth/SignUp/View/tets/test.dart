import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
     return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Email: ${user?.email ?? ''}"),
             Text("Name: ${user!.displayName}"),
             Text("Phone: ${user.phoneNumber}"),
             Text("UID: ${user.uid}"),
           ],
         ),
       ),
     );
  }
}
