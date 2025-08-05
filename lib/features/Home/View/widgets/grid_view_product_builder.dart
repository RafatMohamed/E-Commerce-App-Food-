import 'package:flutter/material.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/widgets/custom_category_product.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    super.key,
    required this.products, required this.productsCount, this.isHomeView =true,
  });
  final int productsCount;
  final List<ProductModel> products;
  final bool isHomeView;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: isHomeView ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      itemCount: productsCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => CustomCategoryProduct(
        product: products[index],
      ),
    );
  }
}
