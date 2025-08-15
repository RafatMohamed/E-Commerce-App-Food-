import 'package:flutter/material.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';

import '../../../../core/utils/app_colors.dart';
import 'list_step_checkout.dart';

class StepHeaderCheckOut extends StatefulWidget {
  const StepHeaderCheckOut({
    super.key,
    required this.currentStep, required this.pageController, required this.order,
  });
 final PageController pageController;
  final int currentStep;
  final OrderModel order;

  @override
  State<StepHeaderCheckOut> createState() => _StepHeaderCheckOutState();
}

class _StepHeaderCheckOutState extends State<StepHeaderCheckOut> {
  @override
  Widget build(BuildContext context) {
    int currentStep=widget.currentStep;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
          colorScheme: const ColorScheme.light(
            primary: AppColor.green1500,
            onSurface: Color(0xffAAAAAA),
          ),
        ),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 1.5,
          child: Stepper(
            physics: const NeverScrollableScrollPhysics(),
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepTapped: (value) {
             setState(() {
               currentStep=value;
               if(widget.order.isCash != null){
                 widget.pageController.animateToPage(currentStep, duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
               }else{
                showSnackBarMessage(context: context, message: "Please select the The methode to shipping");
               }
             });

            },
            steps: listStepCheckout.map((title) {
              final index = listStepCheckout.indexOf(title);
              final isActive = currentStep >= index;
              final color =
              isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface;
              return Step(
                title: Text(title, style: TextStyle(color: color)),
                content: const SizedBox.shrink(),
                isActive: currentStep >= index,
                state:
              currentStep > index
                    ? StepState.complete
                    : StepState.indexed,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
