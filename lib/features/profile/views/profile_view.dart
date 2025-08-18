import 'package:flutter/material.dart';
import 'package:food_app/features/profile/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = "profile";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ProfileViewBody()));
  }
}
