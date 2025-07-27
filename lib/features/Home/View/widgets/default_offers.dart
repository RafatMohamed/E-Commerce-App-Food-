import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/images.dart';

class CustomButtonShopping extends StatelessWidget {
  const CustomButtonShopping({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 32,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.bold13.copyWith(color: AppColor.green1500),
          ),
        ),
      ),
    );
  }
}

class DefaultOffers extends StatelessWidget {
  const DefaultOffers({super.key});
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.sizeOf(context);
    List<Widget> items = [
      DefaultItemCursor(size: size,color: AppColor.green500,image: Assets.imageOffers,),
      DefaultItemCursor(size: size,color: AppColor.orange500,image: Assets.imageOffers2,),
      DefaultItemCursor(size: size,color: AppColor.green1500,image: Assets.imageOffers,),
    ];

    void callbackFunction(int index, CarouselPageChangedReason reason) {}
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 170,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}

class DefaultItemCursor extends StatelessWidget {
  const DefaultItemCursor({
    super.key,
    required this.size, required this.image, required this.color,
  });

  final Size size;
  final String image;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 0,
          bottom: 10,
          child: Center(
            child: Image.asset(
              image,
              width: size.width * 0.8,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          bottom: 10,
          child: ClipPath(
            clipper: LeftOvalClipper(),
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.09),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                shadows: const [
                BoxShadow(
                  color: Color(0xFFF3F5E0),
                  blurRadius: 9,
                  offset: Offset(0, 9),
                  spreadRadius: 20,
                ),
              ],
              ),
              width: size.width * 0.5,
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "عروض العيد",
                    style: TextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  Text(
                    "20% off",
                    style: TextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  CustomButtonShopping(text: "اطلب الأن", onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LeftOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at top-right
    path.moveTo(size.width, 0);

    // Line to top-left
    path.lineTo(size.width * 0.2, 0);

    // Oval curve on the left
    path.quadraticBezierTo(
      0,
      size.height / 2, // control point in the middle left
      size.width * 0.2,
      size.height, // curve ends here
    );

    // Line to bottom-right
    path.lineTo(size.width, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
