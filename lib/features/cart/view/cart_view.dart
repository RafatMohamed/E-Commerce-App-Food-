import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/cart/view/widgets/cart_view_body.dart';

import '../../../core/widgets/custom_button.dart';
import '../logic/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String routeName = "CartView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(
          context: context,
          title:"السلة",
          notificaionVisible: false
      ),
      body:  SafeArea(
        child: Stack(
          children: [
            const CartViewBody(),
            Positioned(
                bottom: 100,
                right: 16,
                left: 16,
                child: CustomButton(text: "الدفع  ${context.watch<CartCubit>().cartModel.claculateTotalprice()} جنيه ",onTap: () {},
                )
            )
          ],
        ),
      ),
    );
  }
}
