import 'package:flutter/material.dart';
import 'package:food_app/features/splash&onBoarding/views/onboarding_view.dart';
import 'package:food_app/features/splash&onBoarding/views/splash_view.dart';
import '../../features/Auth/Login/View/login_view.dart';
import '../../features/Auth/SignUp/View/sign_up_view.dart';
import '../../features/Home/View/best_sellers_view.dart';
import '../../features/Home/View/home_view.dart';
import '../../features/product/View/product_view.dart';
import '../../features/product/View/filter_category_product_view.dart';
import '../../features/MainView/main_view.dart';

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
     case SignUpView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const SignUpView();
      },);
     case HomeView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const HomeView();
      },);
     case MainView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const MainView();
      },);
     case BestSellersView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const BestSellersView();
      },);
     case ProductView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const ProductView();
      },);
     case FilterCategoryProductView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const FilterCategoryProductView();
      },);
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold();
      },);
}
}