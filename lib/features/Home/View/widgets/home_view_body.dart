import 'package:flutter/material.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';
import '../../../../../core/constant.dart';
import '../../../../core/widgets/custom_bloc_provider_best_seller.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import 'custom_app_bar_home.dart';
import 'default_offers.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    // final user2=  FireStoreService().getUserDataFromFireStore(user!.uid);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  const CustomAppBarHome(),
                  const SizedBox(height: 16),
                  const CustomSearchBar(),
                  const SizedBox(height: 12),
                  GestureDetector(
                      onTap: () {
                        FirebaseAuthService().signOut();
                      },
                      child: const Text("logOut")),

                  /// add phone number
                  // FutureBuilder(
                  //   future: FireStoreService().getUserDataFromFireStore(user!.uid),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const CircularProgressIndicator();
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     } else if (snapshot.hasData) {
                  //       final userData = snapshot.data;
                  //       return Text("Phone: ${userData!.phoneNumber}");
                  //     } else {
                  //       return const Text("No data");
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: kDefaultPadding,),
              child: DefaultOffers(),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: BlocProviderBestSeller(),
            ),
          ],
        ),
      ),
    );
  }
}



