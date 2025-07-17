import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.controller,
    required this.onSaved,
    required this.obscureText,
    required this.textInputAction, required this.focusNode,

  });
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) onSaved;
  final bool obscureText;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode:focusNode ,
      autofocus: false,
      validator: (value) {
        if(value==null&&value!.isEmpty){
          return "هذا الحقل مطوب";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.disabled,
      scrollPhysics: const BouncingScrollPhysics(),
      style: TextStyles.semiBold16.copyWith(color: AppColor.grayscale950),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.end,
      controller: controller,
      onSaved:onSaved ,
      obscureText:obscureText ,
      decoration: InputDecoration(
        prefixIcon: suffixIcon,
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: AppColor.grayscale400),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
        enabled: true,
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
