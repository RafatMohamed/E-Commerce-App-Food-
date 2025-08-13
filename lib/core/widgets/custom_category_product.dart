import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/features/cart/data/cart_item_model.dart';
import 'package:food_app/features/cart/view/item_details_cart_view.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../models/product_model.dart';
import '../utils/images.dart';
import 'build_img_product.dart';

class CustomCategoryProduct extends StatelessWidget {
  const CustomCategoryProduct({
    super.key,
    this.onTapFavorite,
    required this.product,
  });
  final Function()? onTapFavorite;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final cartModel = context.read<CartCubit>().cartModel.cartItem.firstWhere(
          (element) => element.productModel.code == product.code,
      orElse: () => CartItemModel(productModel: product, count: 1), // fallback if not found
    );
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ItemDetailsCartView.routeName, arguments: cartModel);},
          child: Container(
            padding: const EdgeInsetsDirectional.only(
              top: 8,
              end: 10,
              bottom: 20,
              start: 10,
            ),
            width: size.width * 0.45,
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F5F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0xFFF3F5E0),
                  blurRadius: 9,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const ShapeDecoration(
                      color: Colors.transparent,
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: onTapFavorite,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.black,
                        alignment: AlignmentDirectional.center,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 36,
                      height: 36,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF1B5E37) /* Green1-500 */,
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            context.read<CartCubit>().addProduct(
                              product: product,
                            );
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add, color: Colors.white),
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.name,
                          textAlign: TextAlign.end,
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColor.grayscale950,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "${product.price}جنية/",
                              textAlign: TextAlign.end,
                              style: TextStyles.bold13.copyWith(
                                color: AppColor.orange500,
                              ),
                            ),
                            Text(
                              " الكيلو",
                              textAlign: TextAlign.start,
                              style: TextStyles.bold13.copyWith(
                                color: AppColor.orange400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 30,
          right: 30,
          child: Image.asset(
            Assets.oval,
            fit: BoxFit.fill,
            height: 50,
            color: Colors.grey.shade400.withValues(alpha: 0.5),
          ),
        ),
        Positioned(
          top: 50,
          left: 10,
          right: 10,
          child: buildProductImage(imagePath: product.imagePath, size: size),
        ),
      ],
    );
  }
}
