import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/cart/data/cart_item_model.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/widgets/custom_category_product.dart';
import '../../../cart/logic/cart_cubit.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    super.key,
    required this.productsCount,
    this.isHomeView =true,
    required this.products,
  });
  final int productsCount;
  final bool isHomeView;
 final List <ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: isHomeView ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
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
        ),
        SizedBox(
          height:MediaQuery.of(context).size.height * 0.25,
        ),
      ],
    );
  }
}
