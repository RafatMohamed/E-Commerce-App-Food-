import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/images.dart';
import 'default_item_cursor_offers.dart';


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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: 170,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            padEnds: false, // removes side padding
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          )
      ),
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

