import 'dart:ui';

import 'package:flutter/material.dart';
import '../../features/Home/View/home_view.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
class DefaultBottomNavigationBar extends StatefulWidget {
  const DefaultBottomNavigationBar({super.key});

  @override
  State<DefaultBottomNavigationBar> createState() =>
      _DefaultBottomNavigationBarState();
}

class _DefaultBottomNavigationBarState extends State<DefaultBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarModel> itemsNav = [
      BottomNavigationBarModel(
        icon: const Icon(Icons.home, color: AppColor.grayscale500),
        label: 'الرئيسية',
        onTap: () {
          Navigator.pushNamed(context, HomeView.routeName);
        },
      ),
      BottomNavigationBarModel(
        icon: const Icon(Icons.category_outlined, color: AppColor.grayscale500),
        label: 'المنتجات',
        onTap: () {},
      ),
      BottomNavigationBarModel(
        icon: const Icon(Icons.shopping_cart, color: AppColor.grayscale500),
        label: 'سلة التسوق',
        onTap: () {},
      ),
      BottomNavigationBarModel(
        icon: const Icon(Icons.person, color: AppColor.grayscale500),
        label: 'حسابي',
        onTap: () {},
      ),
    ];
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 27),
          decoration:  ShapeDecoration(
            gradient: LinearGradient(colors: [
              Colors.white.withValues(alpha: 0.2),
              Colors.white.withValues(alpha: 0.05),
            ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 7,
                offset: Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
            shape: const Border(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children:
            itemsNav.map((item) {
              final index = itemsNav.indexOf(item);
              final isSelected = index == currentIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = itemsNav.indexOf(item);
                    index == currentIndex;
                  });
                  item.onTap();
                },
                child:
                isSelected
                    ? Container(
                  padding: const EdgeInsetsDirectional.only(start: 7),
                  alignment: AlignmentDirectional.centerEnd,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEEEEEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.label,
                        style: TextStyles.semiBold11.copyWith(
                          color: AppColor.green1500,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const ShapeDecoration(
                          color: AppColor.green1500,
                          shape: OvalBorder(),
                        ),
                        child:  Icon(
                          item.icon.icon,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
                    : item.icon,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarModel {
  final String label;
  final Icon icon;
  final Function() onTap;

  BottomNavigationBarModel({
    required this.onTap,
    required this.label,
    required this.icon,
  });
}