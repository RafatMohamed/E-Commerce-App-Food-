import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/utils/images.dart';
import 'on_boarding_view_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const String routeName ="OnBoarding";

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? pageController;
  int currentIndex=0;
  @override
  void initState() {
    super.initState();
    pageController=PageController();
    pageController?.addListener(() {
     setState(() {
       currentIndex=pageController!.page!.toInt();
     });
    },);
  }
  @override
  void dispose() {
pageController?.dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollBehavior: const ScrollBehavior(),
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            OnBoardingPage(
              firstPage: currentIndex==0,
              imageBackground: Assets.imagesPageViewItem1BackgroundImage,
              image: Assets.imagesPageViewItem1Image,
              desc:
                  "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
              size: size,
              pageController: pageController,
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Fruit",
                          style: TextStyles.bold23.copyWith(color: AppColor.green1500),
                        ),
                        Text(
                          "HUB ",
                          style: TextStyles.bold23.copyWith(color: AppColor.orange500),
                        ),
                      ],
                    ),
                    const Text("مرحبًا بك في ", style: TextStyles.bold23),
                  ],
                ),
              ),
            ),
            OnBoardingPage(
              firstPage:false,
              imageBackground: Assets.imagesPageViewItem2BackgroundImage,
              image: Assets.imagesPageViewItem2Image,
              desc:
                  "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
              size: size,
              pageController: pageController,
              title: const Text("ابحث وتسوق", style: TextStyles.bold23),
            ),
          ],
        ),
      ),
    );
  }
}



