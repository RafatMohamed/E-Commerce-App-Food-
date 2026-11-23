import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant.dart';
import '../../../../core/service/Firebase_service/firebase_auth.dart';
import '../../../../core/service/get_it.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../Auth/Login/View/login_view.dart';
import '../favourite_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = (user?.displayName?.isNotEmpty ?? false)
        ? user!.displayName!
        : "مستخدم";
    final email = user?.email ?? "";
    return Column(
      children: [
        customAppBar(
          context: context,
          title: "الملف الشخصي",
          arrowBackVisible: false,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColor.green150,
                child: Text(
                  name.characters.first,
                  style: TextStyles.bold19.copyWith(
                    color: AppColor.green1500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyles.bold19,
              ),
              const SizedBox(height: 4),
              Text(
                email,
                textAlign: TextAlign.center,
                style: TextStyles.regular13.copyWith(
                  color: AppColor.grayscale500,
                ),
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(
                  Icons.favorite_border,
                  color: AppColor.green1500,
                ),
                title: const Text("المفضلة", style: TextStyles.semiBold16),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, FavouriteView.routeName);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  "تسجيل خروج",
                  style: TextStyles.semiBold16.copyWith(color: Colors.red),
                ),
                onTap: () async {
                  await getIt<FirebaseAuthService>().signOutFromGoogle();
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginView.routeName,
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
