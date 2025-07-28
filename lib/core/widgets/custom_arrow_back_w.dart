import 'package:flutter/material.dart';

class CustomArrowBackW extends StatelessWidget {
  const CustomArrowBackW({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
    child:  Container(
      width: 44,
      height: 44,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFF1F1F5),
          ),
        ),
      ),
      child: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    );

  }
}
