import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/view/widgets/check_out_view_body.dart';
import 'package:food_app/features/cart/logic/cart_cubit.dart';
import '../../cart/data/cart_model.dart';


class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cart,});
  static const String routeName = "CheckOutView";
  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:customAppBar(context: context, title: "الدفع",notificaionVisible: false),
      body:  CheckOutViewBody(
        order:OrderModel(
            cartModel: context.read<CartCubit>().cartModel,
        ),
      ),
    );
  }
}

