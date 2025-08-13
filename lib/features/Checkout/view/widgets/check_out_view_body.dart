import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_button.dart';

import '../../../../core/utils/images.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'list_step_checkout.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  int _currentStep = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Theme(
            data: ThemeData(
              canvasColor: Colors.transparent,
              colorScheme: ColorScheme.light(
                primary: AppColor.green1500,
                onSurface: Color(0xffAAAAAA),
              ),
            ),
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 1.5,
              child: Stepper(
                physics: NeverScrollableScrollPhysics(),
                elevation: 0,
                type: StepperType.horizontal,
                currentStep: _currentStep,
                controlsBuilder: (context, details) => const SizedBox(),
                // onStepTapped: (step) {
                //   setState(() => _currentStep = step);
                //   // _pageController.jumpToPage(step);
                // },
                steps:
                    listStepCheckout.map((title) {
                      final index = listStepCheckout.indexOf(title);
                      final isActive = _currentStep >= index;
                      final color =
                          isActive
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface;
                      return Step(
                        title: Text(title, style: TextStyle(color: color)),
                        content: const SizedBox.shrink(),
                        isActive: _currentStep >= index,
                        state:
                            _currentStep > index
                                ? StepState.complete
                                : StepState.indexed,
                      );
                    }).toList(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() => _currentStep = index);
              },
              itemCount: PagesViewCheckOut.length,
              itemBuilder: (context, index) {
                return PagesViewCheckOut[index];
              },
            ),
          ),
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


