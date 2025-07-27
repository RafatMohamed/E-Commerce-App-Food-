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
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: DefaultBottomNavigationBar(),
    );
  }
}


