import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'list_step_checkout.dart';

class StepHeaderCheckOut extends StatelessWidget {
  const StepHeaderCheckOut({
    super.key,
    required int currentStep,
  }) : _currentStep = currentStep;

  final int _currentStep;

  @override
  Widget build(BuildContext context) {
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
            currentStep: _currentStep,
            controlsBuilder: (context, details) => const SizedBox(),
            steps: listStepCheckout.map((title) {
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
    );
  }
}
