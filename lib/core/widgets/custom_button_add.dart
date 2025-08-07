import 'package:flutter/material.dart';

class CustomButtonAddORRemove extends StatelessWidget {
  const CustomButtonAddORRemove({
    super.key, required this.onTap, required this.icon,
  });
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFF1B5E37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}
