import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/widgets/custom_notif_w.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return ListTile(
      trailing: Image.asset(Assets.imagesProfileImage, fit: BoxFit.fill),
      title: Text(
        "..!صباح الخير ",
        textAlign: TextAlign.end,
        style: TextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: Text(
        user!.displayName ?? "",
        textAlign: TextAlign.end,
        style: TextStyles.bold16.copyWith(color: Colors.black),
      ),
      leading: const CustomNotificationW(),
    );
  }
}

