import 'package:flutter/material.dart';

showSnackBarMessage({required BuildContext context, required String message}){
  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(message))
  );
}
