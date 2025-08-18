import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/data/Model/payment_model_paypal.dart';
import 'package:food_app/features/Checkout/logic/order_cubit.dart';
import 'package:food_app/features/Checkout/view/widgets/step_body_checkout.dart';
import 'package:food_app/features/Checkout/view/widgets/step_header_checkout.dart';
import '../../../../core/const_key_secret.dart';
import '../order_success_view.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode notifier = AutovalidateMode.disabled;
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
          StepHeaderCheckOut(
            currentStep: _currentStep,
            pageController: _pageController,
            order: widget.order,
          ),
          StepBodyCheckOut(
            order: widget.order,
            currentStepTap: (index) {
              setState(() => _currentStep = index);
            },
            pageController: _pageController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) {
                if (state is OrderFailed) {
                  showSnackBarMessage(
                    context: context,
                    message: state.errorMsg,
                  );
                }
                if (state is OrderSuccess) {
                  showSnackBarMessage(
                    context: context,
                    message: "Order added successfully",
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OrderConfirmationView(order: widget.order);
                      },
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is OrderLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  text: "التالي",
                  onTap: () {
                    if (widget.order.isCash != null) {
                      if (formKey.currentState!.validate()) {
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
                        } else {
                          _handleOrderWithPayment(context: context,order: widget.order);
                        }
                      } else {
                        notifier = AutovalidateMode.always;
                        showSnackBarMessage(
                          context: context,
                          message: "Please fill all the required fields",
                        );
                      }
                    } else {
                      showSnackBarMessage(
                        context: context,
                        message: "Please select a shipping method",
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void _handleOrderWithPayment({required BuildContext context,required OrderModel order}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder:
          (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: kClientId,
            secretKey: kSecretKey,
            transactions:  [
              PaymentPayPalModel.fromEntity(order).toJson(),
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              log("onSuccess: $params");
              context.read<OrderCubit>().addOrder(order: order);
              Navigator.pushReplacementNamed(context, OrderConfirmationView.routeName);
            },
            onError: (error) {
              log("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              log('cancelled:');
              Navigator.pushReplacementNamed(context, OrderConfirmationView.routeName);
            },
          ),
    ),
  );
}
