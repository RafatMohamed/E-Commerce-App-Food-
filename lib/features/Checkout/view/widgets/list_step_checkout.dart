import 'package:flutter/material.dart';
import 'package:food_app/features/Checkout/view/widgets/paying_view_body.dart';
import 'package:food_app/features/Checkout/view/widgets/review_view_body.dart';
import 'package:food_app/features/Checkout/view/widgets/shipping_view_body.dart';

import '../../../../core/utils/images.dart';
import 'address_view_body.dart';

final List<String> listStepCheckout = ["الشحن", "العنوان", "الدفع","المراجعه",];
final List<Widget> pagesViewCheckOut = [
  const ShippingViewBody(),
  const AddressViewBody(),
  const PaymentViewBody(),
  const ReviewViewBody(),
];
final List<String> cards = [Assets.masterCard, Assets.paypal];

int get currentStepLength => listStepCheckout.length;
