import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_text_styles.dart';
import '../utils/images.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(Assets.imagesFilter,fit: BoxFit.scaleDown,),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(Assets.imagesSearchIcon,fit: BoxFit.scaleDown,),
          ),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'ابحث عن ما تريد',
          alignLabelWithHint: true,
          hintTextDirection:TextDirection.rtl ,
          hintStyle: TextStyles.regular16.copyWith(color: const Color(0xff949D9E),),
      ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.transparent),
      );
  }
}
