import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../best_sellers_view.dart';
import 'grid_view_product_builder.dart';
import 'list_product.dart';
class ProductModel {
  String image;
  String title;
  double price;
  Function()? onTapCartAdd;
  Function()? onTapFavorite;
  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    this.onTapCartAdd,
    this.onTapFavorite,
  });
}
class  DefaultBestSellers extends StatelessWidget {
  const DefaultBestSellers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, BestSellersView.routeName);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration:  ShapeDecoration(
                  gradient: LinearGradient(
                    colors:
                    [
                    Colors.white.withValues(alpha: 0.2),
                    Colors.white.withValues(alpha: 0.05),
                  ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 7,
                      offset: Offset(0, -2),
                      spreadRadius: 0,
                    ),
                  ],
                  shape: const Border(),
                ),
                child: Text("المزيد",style: TextStyles.regular13.copyWith(
                    color: AppColor.grayscale400),),
              ),
            ),
            Text("الاكثر مبيعا",
              style: TextStyles.bold16.copyWith(color: AppColor.grayscale950),),
          ],
        ),
        const SizedBox(height: 8,),
        GridViewProduct(products: products,productsCount: 6,),
      ],
    );
  }
}


