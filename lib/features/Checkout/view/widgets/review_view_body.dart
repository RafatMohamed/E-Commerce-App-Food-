import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'list_step_checkout.dart';

class ReviewViewBody extends StatelessWidget {
  const ReviewViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'ملخص الطلب :',
          textDirection: TextDirection.rtl,
          style: TextStyles.bold13.copyWith(color: AppColor.grayscale950),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    '150 جنيه',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.bold16.copyWith(
                      color: AppColor.grayscale950,
                    ),
                  ),
                  Text(
                    'المجموع الفرعي :',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.regular16.copyWith(
                      color: AppColor.grayscale500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    '30 جنيه',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.bold16.copyWith(
                      color: AppColor.grayscale500,
                    ),
                  ),
                  Text(
                    "التوصيل  :",
                    textDirection: TextDirection.rtl,
                    style: TextStyles.regular16.copyWith(
                      color: AppColor.grayscale500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(thickness: 0.5, endIndent: 16, indent: 16),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    '150 جنيه',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.bold16.copyWith(
                      color: AppColor.grayscale950,
                    ),
                  ),
                  Text(
                    'المجموع الكلي :',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.bold16.copyWith(
                      color: AppColor.grayscale950,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          ' يرجي تأكيد  طلبك :',
          textDirection: TextDirection.rtl,
          style: TextStyles.bold13.copyWith(color: AppColor.grayscale950),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'تعديل ',
                          textDirection: TextDirection.rtl,
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColor.grayscale400,
                          ),
                        ),
                        const Icon(Icons.edit,size: 16,color: AppColor.grayscale400,),
                      ],
                    ),
                  ),
                  Text(
                    'وسيلة الدفع',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.bold13.copyWith(
                      color: AppColor.grayscale950,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    cards[0],
                  ),
                  Text(
                    "**** **** **** 6522",
                    textDirection: TextDirection.rtl,
                    style: TextStyles.regular16.copyWith(
                      color: AppColor.grayscale500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'تعديل ',
                          textDirection: TextDirection.rtl,
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColor.grayscale400,
                          ),
                        ),
                        const Icon(Icons.edit,size: 16,color: AppColor.grayscale400,),
                      ],
                    ),
                  ),
                  Text(
                    ' عنوان التوصيل',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.bold13.copyWith(
                      color: AppColor.grayscale950,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "شارع النيل، مبنى رقم ١٢٣",
                    textDirection: TextDirection.rtl,
                    style: TextStyles.regular16.copyWith(
                      color: AppColor.grayscale500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.location_on,size: 16,color: AppColor.grayscale400,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
