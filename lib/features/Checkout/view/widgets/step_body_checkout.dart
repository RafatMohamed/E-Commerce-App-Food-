import 'package:flutter/material.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/view/widgets/paying_view_body.dart';
import 'package:food_app/features/Checkout/view/widgets/review_view_body.dart';
import 'package:food_app/features/Checkout/view/widgets/shipping_view_body.dart';

import 'address_view_body.dart';

class StepBodyCheckOut extends StatelessWidget {
  const StepBodyCheckOut({
    super.key,
    required this.currentStepTap,
    required this.pageController, required this.order,
  }) ;
  final PageController pageController;
  final Function(int) currentStepTap;
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pagesViewCheckOut = [
       ShippingViewBody(
        order: order,
      ),
      AddressViewBody(
        orderModel: order,
      ),
       PaymentViewBody(
         order: order,
       ),
       ReviewViewBody(
         order: order,
       ),
    ];
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: currentStepTap,
          itemCount: pagesViewCheckOut.length,
          itemBuilder: (context, index) {
            return pagesViewCheckOut[index];
          },
        ),
      ),
    );
  }
}
