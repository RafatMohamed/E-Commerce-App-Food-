import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/Checkout/view/widgets/check_out_view_body.dart';


class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const String routeName = "CheckOutView";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:customAppBar(context: context, title: "الدفع",notificaionVisible: false),
      body: const CheckOutViewBody(),
    );
  }
}

