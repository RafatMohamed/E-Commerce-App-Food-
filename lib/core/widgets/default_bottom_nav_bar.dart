import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
class DefaultBottomNavigationBar extends StatelessWidget {
  const DefaultBottomNavigationBar({super.key,required this.currentIndex, required this.onCurrentIndexChange});
  final int currentIndex ;
  final Function(int index) onCurrentIndexChange;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarModel> itemsNav = [
      BottomNavigationBarModel(
        icon: const Icon(Icons.home, color: AppColor.grayscale500),
        label: 'الرئيسية',
      ),
      BottomNavigationBarModel(
        icon: const Icon(Icons.category_outlined, color: AppColor.grayscale500),
        label: 'المنتجات',
      ),
      BottomNavigationBarModel(
        icon: const Icon(Icons.shopping_cart, color: AppColor.grayscale500),
        label: 'سلة التسوق',
      ),
      BottomNavigationBarModel(
        icon: const Icon(Icons.person, color: AppColor.grayscale500),
        label: 'حسابي',
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
                 onCurrentIndexChange(index);
                },
                child:
                isSelected
                    ? AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsetsDirectional.only(start: 7),
                  alignment: AlignmentDirectional.centerEnd,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEEEEEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(
                        item.label,
                    key: ValueKey('selected-${item.label}'),
                        style: TextStyles.semiBold11.copyWith(
                          color: AppColor.green1500,
                        ),
                      ),
                      AnimatedContainer(
                        width: 50,
                        height: 50,
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.fastOutSlowIn,
                        decoration:  ShapeDecoration(
                          color: AppColor.green1500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child:  Icon(
                          item.icon.icon,
                          key: ValueKey('unselected-${item.label}'),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
                    : AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    width: 40,
                    height: 40,
                    child: item.icon
                ),
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

  BottomNavigationBarModel({
    required this.label,
    required this.icon,
  });
}