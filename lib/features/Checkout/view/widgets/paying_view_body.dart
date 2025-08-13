
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import'list_step_checkout.dart';


class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  int indexSelectedPayment = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'أختار طريقه الدفع المناسبه :',
          style: TextStyles.bold13.copyWith(color: AppColor.grayscale950),
        ),
        const SizedBox(height: 15),
        Text(
          'من فضلك اختر طريقه الدفع المناسبه لك.',
          textAlign: TextAlign.right,
          style: TextStyles.regular13.copyWith(color: AppColor.grayscale600),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(cards.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexSelectedPayment = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 103,
                height: 65,
                decoration: BoxDecoration(
                  color:
                  indexSelectedPayment == index
                      ? Colors.transparent.withValues(alpha: 0.5)
                      : Colors.grey.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color:
                    indexSelectedPayment == index
                        ? const Color(0xFF34A853)
                        : Colors.grey,
                    width: 5,
                  ),
                ),
                child: SvgPicture.asset(cards[index], fit: BoxFit.scaleDown),
              ),
            );
          }),
        ),
      ],
    );
  }
}