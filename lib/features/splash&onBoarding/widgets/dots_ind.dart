import 'package:flutter/material.dart';


class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.primaryColor,
    required this.strokeColor,
    required this.strokeWidth,
    required this.size, required this.onTap,
  });
  final Color primaryColor;
  final Color strokeColor;
  final double strokeWidth;
  final double size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Easing.legacyAccelerate,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(
              color: strokeColor.withValues(alpha: 0.5),
              width: strokeWidth,
            ),
          ),
        ),
      ),
    );
  }
}
