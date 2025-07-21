import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/service/get_it.dart';
import 'package:food_app/features/Auth/Login/View/login_view.dart';
import 'package:food_app/features/Auth/Login/data/login_repo.dart';
import 'package:food_app/features/Auth/Login/logic/login_cubit.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return BlocProvider(
      create: (context) => LoginCubit(
        loginRepo: getIt<LoginRepo>()
      ),
      child: Builder(
        builder: (context) {
          final cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user!.photoURL ?? ''),
                  ),
                  IconButton(
                    onPressed: () async {
                      await cubit.logOutFromGoogle();
                      Navigator.pushReplacementNamed(context, LoginView.routeName);
                    },
                    icon: Icon(Icons.logout),
                  ),
                  Text("Email: ${user.email ?? ''}"),
                  Text("Name: ${user.displayName}"),
                  Text("Phone: ${user.phoneNumber}"),
                  Text("UID: ${user.uid}"),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
