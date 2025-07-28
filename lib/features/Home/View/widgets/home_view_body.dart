import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';
import 'custom_app_bar_home.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import 'default_offers.dart';
import 'deffault_best_seller_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
               child: Column(
                 children: [
                   CustomAppBarHome(),
                   SizedBox(height: 16),
                   CustomSearchBar(),
                   SizedBox(height: 12),
                 ],
               ),
             ),
            Padding(
              padding:  EdgeInsets.only(right: kDefaultPadding,),
              child:  DefaultOffers(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  DefaultBestSellers (),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

