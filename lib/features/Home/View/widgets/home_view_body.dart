import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';
import 'custom_app_bar_home.dart';
import '../../../../core/widgets/custom_search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            CustomAppBarHome(),
            SizedBox(height: 16),
            CustomSearchBar(),
        ],
        ),
      ),
    );
  }
}


