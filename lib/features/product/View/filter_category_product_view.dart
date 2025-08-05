import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/service/get_it.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/Home/logic/ProductCubit/product_cubit.dart';
import 'package:food_app/features/product/View/widgets/product_view_body_filter.dart';
import '../../../core/repo/Product_repo/product_repo.dart';

class FilterCategoryProductView extends StatelessWidget {
  const FilterCategoryProductView({super.key});

  static const String routeName = "filterCategoryProductView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: "المنتجات",
          arrowBackVisible: false
      ),
      body: BlocProvider(
        create: (context) => ProductCubit(
            productRepo:getIt<ProductRepo>(),
        ),
        child: const SafeArea(
          child: ProductViewBodyFilter(),
        ),
      ),
    );
  }
}