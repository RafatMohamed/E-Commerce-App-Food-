import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.text, required this.onTap,
  });
  final String  text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColor.green1500,
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.bold16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
