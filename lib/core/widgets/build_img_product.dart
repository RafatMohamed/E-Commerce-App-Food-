import 'package:flutter/material.dart';

Widget buildProductImage({required String? imagePath,bool isScaleCover =true,bool isItemCart = false,required Size size}) {
  if (imagePath == null ) {
    return const Icon(Icons.image_not_supported);
  }
  return  Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width:isItemCart ? size.width * 0.5 :size.width * 0.25,
        height:isItemCart ? size.height * 0.5 : size.height * 0.1,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          imagePath,
          fit: isScaleCover ? BoxFit.cover : BoxFit.scaleDown,
          errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image),
        ),
      ),
    ],
  );
}
