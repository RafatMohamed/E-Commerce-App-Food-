import 'package:flutter/material.dart';

showSnackBarMessage({required BuildContext context, required String message}){
  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(message),duration: Duration(milliseconds: 300),),
    snackBarAnimationStyle: AnimationStyle(
      duration: Duration(milliseconds: 300),
    )
  );
}
