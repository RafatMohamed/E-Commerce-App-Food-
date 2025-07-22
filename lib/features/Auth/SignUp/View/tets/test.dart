import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/service/Firebase_service/fire_store.dart';
import '../../../../../core/service/get_it.dart';
import '../../../Login/View/login_view.dart';
import '../../../Login/data/login_repo.dart';
import '../../../Login/logic/login_cubit.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({super.key});

  get fireStoreService => null;

  Future<UserModel> loadUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('No user logged in');
    final fireStore = getIt<FireStoreService>(); // ✅ inject properly
    return await fireStore.getUserDataFromFireStore(user.uid);
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(
          loginRepo: getIt<LoginRepo>(),
        ),
        child: FutureBuilder<UserModel>(
          future: loadUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
            }

            final user = snapshot.data!;
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await LoginCubit.get(context).logOutFromGoogle();
                        Navigator.pushReplacementNamed(context, LoginView.routeName);
                      },
                      icon: const Icon(Icons.logout),
                    ),
                    Text("Email: ${user.email}"),
                    Text("Name: ${user.name}"),
                    Text("Phone: ${user.phoneNumber}"), // ✅ this works now
                    Text("UID: ${user.id}"),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}