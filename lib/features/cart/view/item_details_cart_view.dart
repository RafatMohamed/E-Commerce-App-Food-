import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/widgets/build_img_product.dart';
import 'package:food_app/core/widgets/custom_star_button.dart';
import 'package:food_app/features/cart/view/widgets/custom_list_view_cart.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/images.dart';
import '../../../core/widgets/custom_arrow_back_w.dart';
import '../data/cart_item_model.dart';
import '../logic/cart_cubit.dart';

class ItemDetailsCartView extends StatelessWidget {
  const ItemDetailsCartView({super.key, required this.cartItem});
  static const String routeName = "ItemDetailsCartView";
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final productModel = cartItem.productModel;
    final List<CustomItemCartDetails> customItemCartDetails = [
      const CustomItemCartDetails(
        img: Assets.lotus,
        title: "100%",
        desc: "منتج طبيعي",
      ),
      CustomItemCartDetails(
        img: Assets.calendar,
        title: "${productModel.shelf_life}",
        desc: "الصلاحية",
      ),
      CustomItemCartDetails(
        img: Assets.stars,
        title: "${productModel.rate} (${productModel.ratingCount})",
        desc: "Reviews",
      ),
      CustomItemCartDetails(
        img: Assets.calories,
        title: "${productModel.calories} كالوري",
        desc: "${productModel.weight_grams_per_unit} جرام",
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: -258,
                  right: -258,
                  bottom: size.height * 0.01,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: const ShapeDecoration(
                      color: Color(0xffF3F5F7),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: size.height * 0.01,
                  child: Hero(
                    tag: tHeroImgCard,
                    child: buildProductImage(
                      imagePath: productModel.imagePath,
                      size: size,
                      isItemCart: true,
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 26,
                  child: CustomArrowBackW(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              return  CustomButtonsAddRemoveWithCount(
                                cartItem: cartItem,
                              );
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                productModel.name,
                                textAlign: TextAlign.end,
                                style: TextStyles.semiBold13.copyWith(
                                  color: AppColor.grayscale950,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "${productModel.price}جنية/",
                                    textAlign: TextAlign.end,
                                    style: TextStyles.bold13.copyWith(
                                      color: AppColor.orange500,
                                    ),
                                  ),
                                  Text(
                                    " الكيلو",
                                    textAlign: TextAlign.start,
                                    style: TextStyles.bold13.copyWith(
                                      color: AppColor.orange300,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 9,
                        children: [
                          const Text(
                            'المراجعه',
                            style: TextStyle(
                              color: Color(0xFF1B5E37) /* Green1-500 */,
                              fontSize: 13,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: '(',
                                  style: TextStyle(
                                    color: Color(0xFF9796A1),
                                    fontSize: 14,
                                    fontFamily: 'IBM Plex Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '${productModel.ratingCount}+',
                                  style: const TextStyle(
                                    color: Color(0xFF9796A1),
                                    fontSize: 13,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                    height: 1.60,
                                  ),
                                ),
                                const TextSpan(
                                  text: ')',
                                  style: TextStyle(
                                    color: Color(0xFF9796A1),
                                    fontSize: 14,
                                    fontFamily: 'IBM Plex Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${productModel.rate}",
                            style: const TextStyle(
                              color: Color(0xFF111719),
                              fontSize: 13,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                              height: 1.70,
                            ),
                          ),
                         const Star(isFilled: true),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                       productModel.description,
                        style: TextStyles.regular13.copyWith(
                          color: const Color(0xFF969899),
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics:  const NeverScrollableScrollPhysics(),
                        itemCount: customItemCartDetails.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 130,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) =>customItemCartDetails[index],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomItemCartDetails extends StatelessWidget {
  const CustomItemCartDetails({super.key, required this.img, required this.title, required this.desc});
  final String img ;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 120,
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          decoration: ShapeDecoration(
            gradient: LinearGradient(colors: [
              Colors.white.withValues(alpha: 0.2),
              Colors.black.withValues(alpha: 0.05),
            ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFFF1F1F5),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  img,
                  width: 64,
                  height: 64,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: TextStyles.bold16.copyWith(
                        color: const Color(0xFF23AA49),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      desc,
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF969899),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}