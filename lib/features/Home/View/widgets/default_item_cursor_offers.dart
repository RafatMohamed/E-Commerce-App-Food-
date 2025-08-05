import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button_shopping.dart';
import 'default_offers.dart';

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
