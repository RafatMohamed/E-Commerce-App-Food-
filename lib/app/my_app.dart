
import 'package:flutter/material.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/helper/on_generate_routes.dart';
import 'package:food_app/features/splash&onBoarding/views/splash_view.dart';

class FruitsApp extends StatelessWidget{
  const FruitsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: kFontFamily),
    onGenerateRoute:onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
