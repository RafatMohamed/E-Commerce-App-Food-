import 'package:flutter/material.dart';
import 'package:food_app/features/splash&onBoarding/views/onboarding_view.dart';
import 'package:food_app/features/splash&onBoarding/views/splash_view.dart';

import '../../features/Auth/Login/View/login_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting){
  switch(setting.name){
    case SplashView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const SplashView();
      },);
     case OnBoardingView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const OnBoardingView();
      },);
     case LoginView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const LoginView();
      },);
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold();
      },);
}
}