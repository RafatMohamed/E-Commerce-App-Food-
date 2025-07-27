import 'package:flutter/material.dart';
import 'package:food_app/features/Home/View/widgets/login_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return const Scaffold(
      body: SafeArea(child: HomeViewBody(

      )),
    );
  }
}




