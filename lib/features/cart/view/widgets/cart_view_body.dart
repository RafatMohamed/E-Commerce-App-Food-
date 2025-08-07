import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/widgets/build_img_product.dart';
import 'package:food_app/core/widgets/custom_button.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button_add.dart';
import '../../logic/cart_cubit.dart';
import 'custom_list_view_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(color: AppColor.green150),
          child: Center(
            child: Text(
              'لديك ${context.watch<CartCubit>().cartModel.cartItem.length} منتجات في سله التسوق',
              style: TextStyles.regular13.copyWith(color: AppColor.green1500),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Visibility(
            visible: !(context.read<CartCubit>().cartModel.cartItem.length == 0),
            child: InkWell(
              onTap: () {
                context.read<CartCubit>().clearCart();
              },
              child: Row(
                children: [
                  const Icon(Icons.restore_from_trash_outlined),
                  const SizedBox(width: 4),
                  Text(
                    'حذف كل المنتجات',
                    style: TextStyles.regular13.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const ListViewBodyCartView(),
          ),
        ),
      ],
    );
  }
}

class ListViewBodyCartView extends StatelessWidget {
  const ListViewBodyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitCartModel = context.watch<CartCubit>().cartModel.cartItem;
    return ListView.builder(
      itemCount: cubitCartModel.length,
      itemBuilder: (context, index) {
        if (cubitCartModel.isEmpty) {
          return Center(child: Text("السلة فارغة"));
        }
        return CustomListViewCart(cartItem: cubitCartModel[index],);
      },
    );
  }
}
