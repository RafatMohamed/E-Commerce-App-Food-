import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/Home/View/widgets/grid_view_product_builder.dart';
import 'package:food_app/features/Home/View/widgets/list_product.dart';
import '../../../core/constant.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class BestSellersView extends StatelessWidget {
  const BestSellersView({super.key});
  static const String routeName = "Best Sellers";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "الاكثر مبيعا"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "الاكثر مبيعا",
                style: TextStyles.bold16.copyWith(color: AppColor.grayscale950),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridViewProduct(
                  isHomeView: false,
                  products: products,
                  productsCount: products.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
