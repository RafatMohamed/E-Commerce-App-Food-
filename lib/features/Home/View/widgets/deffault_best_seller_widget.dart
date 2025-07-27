import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/widgets/custom_category_product.dart';
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
    List<ProductModel> products = [
      ProductModel(image: Assets.imagesWatermelonTest, title: "بطيخ", price: 20.00),
      ProductModel(image: Assets.strawberry, title: "فراولة", price: 30.00),
      ProductModel(image: Assets.avocado, title: "أفوكادو", price: 200.00),
      ProductModel(image: Assets.pineapple, title: "أناناس", price: 20.00),
      ProductModel(image: Assets.banana, title: "موز", price: 20.00),
      ProductModel(image: Assets.mango, title: "مانجو", price: 60.00),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("المزيد", style: TextStyles.regular13.copyWith(
                color: AppColor.grayscale400),),
            Text("الاكثر مبيعا",
              style: TextStyles.bold16.copyWith(color: AppColor.grayscale950),),
          ],
        ),
        const SizedBox(height: 8,),
        GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) => CustomCategoryProduct(
            image: products[index].image ,
            title: products[index].title,
            price:  products[index].price,
            onTapCartAdd: products[index].onTapCartAdd,
            onTapFavorite:products[index].onTapFavorite,
          ),
        ),
      ],
    );
  }
}

