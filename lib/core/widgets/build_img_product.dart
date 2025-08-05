import 'package:flutter/material.dart';

Widget buildProductImage({required String? imagePath,bool isScaleCover =true ,required Size size}) {
  if (imagePath == null ) {
    return const Icon(Icons.image_not_supported);
  }
  return  Stack(
    alignment: Alignment.center,
    children: [
      // Container(
      //   width: 130,
      //   height: 100,
      //   clipBehavior: Clip.antiAlias,
      //   decoration: const BoxDecoration(
      //     shape: BoxShape.circle,
      //   ),
      //   child: Image.network(
      //     imagePath,
      //     fit: isScaleCover ? BoxFit.cover : BoxFit.scaleDown, // Fill the entire oval
      //     errorBuilder: (context, error, stackTrace) =>
      //     const Icon(Icons.broken_image),
      //   ),
      // ),
      Container(
        width:size.width * 0.25,
        height: size.height * 0.1,
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
