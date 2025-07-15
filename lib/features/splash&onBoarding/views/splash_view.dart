import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/service/StorageLocal/SharedPrefs.dart';
import 'package:food_app/core/utils/images.dart';
import 'package:food_app/features/Auth/Login/View/login_view.dart';
import 'package:food_app/features/splash&onBoarding/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName ="Splash";
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animationControllerBottom;
  late AnimationController animationControllerPLant;
  late AnimationController animationControllerLogo;
  late Animation<Offset> _splashBottomAnimation;
  late Animation<double> _plantScaleAnimation;
  late Animation<double> _logoOpacityAnimation;

  @override
  void initState() {
    super.initState();
    toDoAnimation();
  }

  @override
  void dispose() {
    animationControllerPLant.dispose();
    animationControllerLogo.dispose();
    animationControllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _plantScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _plantScaleAnimation.value,
                  child: child,
                );
              },
              child: SvgPicture.asset(Assets.imagesPlant),
            ),
          ),

          Center(
            child: AnimatedBuilder(
              animation: _logoOpacityAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoOpacityAnimation.value,
                  child: child,
                );
              },
              child: SvgPicture.asset(Assets.imagesLogo, fit: BoxFit.fill),
            ),
          ),

          Positioned(
            bottom: 0,
            child: AnimatedBuilder(
              animation: _splashBottomAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: _splashBottomAnimation,
                  child: child,
                );
              },
              child: SvgPicture.asset(
                Assets.imagesSplashBottom,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toDoAnimation() {
    animationControllerBottom = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationControllerPLant = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationControllerLogo = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _splashBottomAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationControllerBottom, curve: Curves.linear),
    );

    _plantScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationControllerPLant,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationControllerLogo,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    animationControllerBottom.forward().then(
      (value) => animationControllerPLant.forward().then(
        (value) => animationControllerLogo.forward().then((value) async {
          return await navigatorToOnBoarding();
        }),
      ),
    );
  }

  Future<dynamic> navigatorToOnBoarding() {
    return Future.delayed(
        const Duration(seconds: 1), () {
      if (!mounted) return;
      bool seenOnBoarding= PrefesStorage().getBool(kOnBoardingSeen);
     seenOnBoarding ?Navigator.pushReplacementNamed(
         context,
         LoginView.routeName
     ): Navigator.pushReplacementNamed(
        context,
        OnBoardingView.routeName
      );
    });
  }
}
