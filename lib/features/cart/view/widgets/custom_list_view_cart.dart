import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';
import 'package:food_app/features/cart/data/cart_item_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/build_img_product.dart';
import '../../../../core/widgets/custom_button_add.dart';
import '../../logic/cart_cubit.dart';
import '../item_details_cart_view.dart';

class CustomListViewCart extends StatelessWidget {
  const CustomListViewCart({super.key, required this.cartItem});
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ItemDetailsCartView.routeName, arguments:cartItem);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFF1F1F5),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<CartCubit>().removeProduct(
                              product: cartItem.productModel,
                            );
                          },
                          icon: const Icon(Icons.restore_from_trash_outlined),
                        ),
                        Text(
                          cartItem.productModel.code,
                          style: TextStyles.bold13,
                        ),
                      ],
                    ),
                    Text(
                      '${cartItem.productModel.weight_grams_per_unit} كم ',
                      style: TextStyles.regular13.copyWith(
                        color: AppColor.orange500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.3,
                          child: Text(
                            ' جنيه ${cartItem.calculateTotalPriceItem()}  ',
                            softWrap: true,
                            textWidthBasis: TextWidthBasis.parent,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xFFF4A91F) /* Orange-500 */,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        CustomButtonsAddRemoveWithCount(cartItem: cartItem),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: tHeroImgCard,
              child: buildProductImage(
                imagePath: cartItem.productModel.imagePath,
                size: size,
                isScaleCover: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonsAddRemoveWithCount extends StatelessWidget {
  const CustomButtonsAddRemoveWithCount({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonAddORRemove(
          onTap: cartItem.count > 0
              ? () {
            context.read<CartCubit>().decrementCount(
              product: cartItem.productModel,
            );
          }
              : (){},
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '${cartItem.getTotalCount()}',
            textAlign: TextAlign.center,
            style: TextStyles.bold16.copyWith(
              color: AppColor.green1950,
            ),
          ),
        ),
        CustomButtonAddORRemove(
          onTap:cartItem.count < cartItem.productModel.quantity ? () {
            context.read<CartCubit>().incCount(
              product: cartItem.productModel,
            );
          }: (){
         showSnackBarMessage(context: context, message: "لا يوجد المنتجات المتاحة");
          },
          icon: Icons.add,
        ),
      ],
    );
  }
}
