import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/Checkout/view/widgets/step_body_checkout.dart';
import 'package:food_app/features/Checkout/view/widgets/step_header_checkout.dart';
import 'list_step_checkout.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  int _currentStep = 0;
  late PageController _pageController;
  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentStep);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepHeaderCheckOut(currentStep: _currentStep),
        StepBodyCheckOut(
          currentStepTap: (index)
          {
          setState(() => _currentStep = index);
          },
          pageController: _pageController,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(
            text: "التالي",
            onTap: () {
              if (_currentStep < currentStepLength - 1) {
                setState(() {
                  _currentStep++;
                  _pageController.animateToPage(
                    _currentStep,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                });
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ],
    );
  }
}



