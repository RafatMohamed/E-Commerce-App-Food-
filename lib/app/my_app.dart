
import 'package:flutter/material.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/helper/on_generate_routes.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/features/splash&onBoarding/views/splash_view.dart';

class FruitsApp extends StatelessWidget{
  const FruitsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: kFontFamily,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.green1500),
        appBarTheme: const AppBarTheme(
          color: Colors.white
        )

      ),
    onGenerateRoute:onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
