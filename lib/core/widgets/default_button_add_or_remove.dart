import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/cart/data/cart_item_model.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../helper/snackBar_message.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button_add.dart';

class CustomButtonsAddRemoveWithCount extends StatelessWidget {
  const CustomButtonsAddRemoveWithCount({
    super.key,
    required this.cartItem,
    this.isAddButton=true,
    this.isRemoveButton=true,
  });

  final CartItemModel cartItem;
  final bool isAddButton;
  final bool isRemoveButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: isAddButton,
          replacement:const SizedBox(),
          child: CustomButtonAddORRemove(
            onTap: cartItem.count > 0
                ? () {
              context.read<CartCubit>().decrementCount(
                product: cartItem.productModel,
              );
              showSnackBarMessage(
                context: context,
                message: "Product removed from cart",
              );
            }
                : (){},
            icon: Icons.remove,
          ),
        ),
        Visibility(
          visible: isRemoveButton,
          replacement:const SizedBox(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '${cartItem.getTotalCount()}',
              textAlign: TextAlign.center,
              style: TextStyles.bold16.copyWith(
                color: AppColor.green1950,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isRemoveButton,
          replacement:const SizedBox(),
          child: CustomButtonAddORRemove(
            onTap:cartItem.count < cartItem.productModel.quantity ? () {
              context.read<CartCubit>().incCount(
                product: cartItem.productModel,
              );
              showSnackBarMessage(context: context, message: "Product added to cart");
            }: (){
              showSnackBarMessage(context: context, message: "لا يوجد المنتجات المتاحة");
            },
            icon: Icons.add,
          ),
        ),
      ],
    );
  }
}
