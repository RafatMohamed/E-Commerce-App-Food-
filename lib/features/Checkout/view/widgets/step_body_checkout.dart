import 'package:flutter/material.dart';

import 'list_step_checkout.dart';

class StepBodyCheckOut extends StatelessWidget {
  const StepBodyCheckOut({
    super.key,
    required this.currentStepTap,
    required this.pageController,
  }) ;
  final PageController pageController;
  final Function(int) currentStepTap;
  @override
  Widget build(BuildContext context) {
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
