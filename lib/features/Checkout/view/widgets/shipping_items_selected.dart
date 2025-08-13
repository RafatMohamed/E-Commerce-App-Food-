import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class ShippingItemsSelected extends StatelessWidget {
  const ShippingItemsSelected({
    super.key,
    required this.text,
    required this.subText,
    required this.isSelected,
    required this.price,
    required this.onTap,
  });
  final String text;
  final String subText;
  final bool isSelected;
  final int price;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 90,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16, left: 13, bottom: 16),
        decoration:
        isSelected
            ? ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFF1B5E37) /* Green1-500 */,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        )
            : ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${price} جنيه  ',
              style: TextStyles.bold13.copyWith(color: AppColor.green1500),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyles.semiBold13.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      subText,
                      style: TextStyles.regular13.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                isSelected
                    ? Container(
                  width: 18,
                  height: 18,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1B5E37) /* Green1-500 */,
                    shape: OvalBorder(
                      side: BorderSide(width: 4, color: Colors.white),
                    ),
                  ),
                )
                    : Container(
                  width: 18,
                  height: 18,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
