import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/cart/view/widgets/cart_view_body.dart';

import '../../../core/widgets/custom_button.dart';
import '../../Checkout/view/check_out_view.dart';
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
                child: CustomButton(text: "الدفع  ${context.watch<CartCubit>().cartModel.claculateTotalprice()} جنيه ",onTap: () {
                  if(context.read<CartCubit>().cartModel.cartItem.isNotEmpty){
                    Navigator.pushNamed(context, CheckOutView.routeName,arguments:context.read<CartCubit>().cartModel);
                  }else{
                   showSnackBarMessage(context: context, message: "The Cart is empty please Shopping and try again");
                  }
                },
                )
            )
          ],
        ),
      ),
    );
  }
}
