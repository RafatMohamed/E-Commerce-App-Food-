import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/data/Model/payment_model_paypal.dart';
import 'package:food_app/features/Checkout/logic/order_cubit.dart';
import 'package:food_app/features/Checkout/view/widgets/step_body_checkout.dart';
import 'package:food_app/features/Checkout/view/widgets/step_header_checkout.dart';
import '../../../../core/const_key_secret.dart';
import '../../../cart/logic/cart_cubit.dart';
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
  bool isPaid = false;
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
  void _handleOrderWithoutPayment(int currentStep) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (currentStep < currentStepLength - 1) {
        if (currentStep == 0 && widget.order.isCash == null) {
          showSnackBarMessage(
            context: context,
            message: "Please select a shipping method",
          );
          return;
        }

        if (currentStep == 2 &&
            widget.order.paymentMethode == null) {
          showSnackBarMessage(
            context: context,
            message: "Please select a payment method",
          );
          return;
        }

        if (currentStep == 2) {
          setState(() => currentStep++);
          _pageController.animateToPage(
            currentStep,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
          if (widget.order.paymentMethode == pIsPayPal) {
            showSnackBarMessage(
              context: context,
              message: "using paypal",
            );
            return;
          }
          if (widget.order.paymentMethode == pIsCard) {
            showSnackBarMessage(
              context: context,
              message: "card not available now",
            );
            return;
          }
          if (widget.order.paymentMethode == pIsCash) {
            showSnackBarMessage(
              context: context,
              message: "using cash",
            );
            return;
          }
        }
        setState(() => currentStep++);
        _pageController.animateToPage(
          currentStep,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      } else {
        if (widget.order.paymentMethode == pIsPayPal) {
          if (!isPaid) {
            _handleOrderWithPayment(
              context: context,
              order: widget.order,
              onSuccess: () {
                setState(() {
                  isPaid = true;
                });
                Navigator.pushReplacementNamed(
                  context,
                  OrderConfirmationView.routeName,
                  arguments: widget.order,
                );
              },
            );
            return;
          } else {
            Navigator.pushReplacementNamed(
              context,
              OrderConfirmationView.routeName,
              arguments: widget.order,
            );
            setState(() {
              isPaid = false;
            });
            return;
          }
        }
        Navigator.pushReplacementNamed(
          context,
          OrderConfirmationView.routeName,
          arguments: widget.order,
        );
        context.read<CartCubit>().clearCart();
      }
    }
    else {
      notifier = AutovalidateMode.always;
      showSnackBarMessage(
        context: context,
        message: "Please fill all the required fields",
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: notifier,
      child: Column(
        children: [
          StepHeaderCheckOut(
            handleStepPayment: (currentStep) {
              _handleOrderWithoutPayment(currentStep-1);
              },
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
                    _handleOrderWithoutPayment(_currentStep);
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

void _handleOrderWithPayment({
  required BuildContext context,
  required OrderModel order,
  required VoidCallback onSuccess,
}) {
  final cubit = context.read<OrderCubit>();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder:
          (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: kClientId,
            secretKey: kSecretKey,
            transactions: [PaymentPayPalModel.fromEntity(order).toJson()],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              log("onSuccess: $params");
              cubit.addOrder(order: order);
              onSuccess();
            },
            onError: (error) {
              log("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              log('cancelled:');
              Navigator.pushReplacementNamed(
                context,
                OrderConfirmationView.routeName,
                arguments: order,
              );
            },
          ),
    ),
  );
}
