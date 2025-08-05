import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/product/View/widgets/prduct_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  static const String routeName = "productView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(
        context: context,
        title:"المنتجات",
        arrowBackVisible: false
      ),
      body: const SafeArea(
        child: ProductViewBody(),
      ),
    );
  }
}
