import 'package:flutter/material.dart';
import 'package:food_app/features/Home/View/widgets/home_view_body.dart';
import '../../../core/widgets/default_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return const Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
          HomeViewBody(),
          Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: DefaultBottomNavigationBar()),
        ],
      )),
    );
  }
}


