import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/logic/order_cubit.dart';
import '../../../../core/constant.dart';
import '../../../../core/service/StorageLocal/shared_prefs.dart';
import '../order_success_view.dart';
import 'list_step_checkout.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key, required this.order});
  final OrderModel order;
  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody>
    with AutomaticKeepAliveClientMixin {
  int indexSelectedPayment = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  widget.order.paymentMethode =
                      index == 0
                          ? pIsCash
                          : widget.order.paymentMethode =
                              index == 1 ? pIsCard : pIsPayPal;
                  PrefsStorage().saveString(
                    pPaymentMethode,
                    widget.order.paymentMethode!,
                  );
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
