import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class DefaultLoginMedia extends StatelessWidget {
  const DefaultLoginMedia({
    super.key, required this.text, required this.onPressed, required this.logoIcon,
  });
  final String text;
  final String logoIcon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        height: 56,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Stack(
          textDirection: TextDirection.rtl,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                text ,
                textAlign: TextAlign.center,
                style: TextStyles.semiBold16.copyWith(
                  color: AppColor.grayscale950,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SvgPicture.asset(logoIcon,width: 20,height: 20,),
            ),
          ],
        ),
      ),
    );
  }
}
