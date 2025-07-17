import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/service/StorageLocal/shared_prefs.dart';
import 'package:food_app/features/Auth/Login/View/login_view.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../widgets/dots_ind.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.size,
    required this.image,
    required this.imageBackground,
    required this.desc,
    required this.title,
    this.pageController,
    required this.firstPage,
  });
 final PageController? pageController;
  final Size size;
  final String image;
  final String imageBackground;
  final String desc;
  final Widget title;
 final  bool firstPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        firstPage
            ? Positioned(
              right: 20,
              top: 40,
              child: GestureDetector(
                onTap: () {
              seenOnBoardingOrNot(context);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: AppColor.grayscale400.withValues(alpha: 0.5),
                  ),
                  child: Text(
                    "تخط",
                    style: TextStyles.bold13.copyWith(color: Colors.black),
                  ),
                ),
              ),
            )
            : const Text(""),
        Positioned(
          child: SvgPicture.asset(
            width: size.width,
            imageBackground,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 65,
              children: [
                SvgPicture.asset(image, fit: BoxFit.scaleDown),
                Column(
                  spacing: 23,
                  children: [
                    title,
                    Text(
                      desc,
                      style: TextStyles.semiBold13,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                firstPage
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        DotsIndicator(
                          onTap: () {
                            pageController?.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          primaryColor: AppColor.green1500,
                          strokeColor: AppColor.green500,
                          strokeWidth: 2,
                          size: 11,
                        ),
                        DotsIndicator(
                          onTap: () {
                            pageController?.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          primaryColor: AppColor.green500,
                          strokeColor: AppColor.green500,
                          strokeWidth: 2,
                          size: 9,
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        DotsIndicator(
                          onTap: () {
                            pageController?.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          primaryColor: AppColor.green1500,
                          strokeColor: AppColor.green500,
                          strokeWidth: 2,
                          size: 11,
                        ),
                        DotsIndicator(
                          onTap: () {
                            pageController?.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          primaryColor: AppColor.green1500,
                          strokeColor: AppColor.green500,
                          strokeWidth: 2,
                          size: 11,
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
        firstPage
            ? const Text("")
            : Positioned(
              bottom: 40,
              left: 16,
              right: 16,
              child: CustomButton(text: "ابدأ الان",
                  onTap: () {
                seenOnBoardingOrNot(context);
                Navigator.pushReplacementNamed(context, LoginView.routeName);
                  }),
            ),
      ],
    );
  }

  void seenOnBoardingOrNot(BuildContext context) async{
    await PrefsStorage().saveBool(kOnBoardingSeen, true);
  }
}
