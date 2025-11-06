import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/service/Firebase_service/firebase_auth.dart';
import '../../../../../core/constant.dart';
import '../../../../core/service/Firebase_service/fire_store_service.dart';
import '../../../../core/widgets/custom_bloc_provider_best_seller.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../profile/views/favourite_view.dart';
import 'custom_app_bar_home.dart';
import 'default_offers.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final user2=  FireStoreService().getUserDataFromFireStore(user!.uid);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: [
            TextButton(onPressed: () {
              Navigator.pushNamed(context, FavouriteView.routeName);
            }, child: const Text("المفضلة")),
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
                  const SizedBox(height: 12),
                  Text(user.displayName.toString()),
                  const SizedBox(height: 12),

                  /// add phone number
                  FutureBuilder(
                    future: user2,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final userData = snapshot.data;
                        return Text("Phone: ${userData!.phoneNumber}");
                      } else {
                        return const Text("No data");
                      }
                    },
                  ),
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



