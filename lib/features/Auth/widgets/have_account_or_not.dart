import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key, required this.onPressed, required this.text, required this.textButton,
  });
  final Function() onPressed;
  final String text;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyles.regular16.copyWith(
              color: AppColor.grayscale400,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            text: textButton,
            style: TextStyles.regular16.copyWith(
              color: AppColor.green1500,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
