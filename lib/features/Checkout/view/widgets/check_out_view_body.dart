import 'package:flutter/material.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/view/widgets/step_body_checkout.dart';
import 'package:food_app/features/Checkout/view/widgets/step_header_checkout.dart';
import 'list_step_checkout.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key, required this.order});
  final OrderModel order;
  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  int _currentStep = 0;
  late PageController _pageController;
  GlobalKey<FormState> formKey=GlobalKey();
   AutovalidateMode notifier=AutovalidateMode.disabled;
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
    return Form(
      key: formKey,
      autovalidateMode: notifier,
      child: Column(
        children: [
          StepHeaderCheckOut(currentStep: _currentStep,pageController: _pageController,order: widget.order,),
          StepBodyCheckOut(
            order: widget.order,
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
                if(widget.order.isCash != null){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    if (_currentStep < currentStepLength - 1) {
                      setState(() {
                        _currentStep++;
                        _pageController.animateToPage(
                          _currentStep,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    }else {
                      Navigator.pop(context);
                    }
                  }
                  else{
                    showSnackBarMessage(context: context, message: "Please fill all the required fields");
                    notifier=AutovalidateMode.always;
                  }
                }else{
                  showSnackBarMessage(context: context, message: "Please select the The methode to shipping");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}



