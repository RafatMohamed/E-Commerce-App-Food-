import 'package:flutter/material.dart';

import '../../../core/utils/app_text_styles.dart';
abstract class CustomAppBarRegister {
 static AppBar customAppBar(
      {
        required BuildContext context,
        required String title,
        required bool isRegister,
      }
      ) {
    return AppBar(
      title: Text(title, style: TextStyles.bold19),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        Visibility(
          visible: isRegister,
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                end: 16
            ),
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
            child: IconButton(
              onPressed:() =>Navigator.pop(context),
              icon: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

