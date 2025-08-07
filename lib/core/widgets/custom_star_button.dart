import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final bool isFilled;
  final double size;
  final Color color;

  const Star({
    super.key,
    required this.isFilled,
    this.size = 24,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      isFilled ? Icons.star : Icons.star_border,
      size: size,
      color: color,
    );
  }
}
