import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/service/get_it.dart';

import '../../../core/constant.dart';
import '../../../core/repo/Product_repo/product_repo.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bloc_provider_best_seller.dart';
import '../../Home/View/widgets/grid_view_product_builder.dart';
import '../../Home/View/widgets/product_builder_best_seller.dart';
import '../../Home/logic/ProductCubit/product_cubit.dart';
import '../../Home/logic/ProductCubit/product_state.dart';
import '../../cart/logic/cart_cubit.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});


  static const String routeName = "FavouriteView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: "المفضلة",
          arrowBackVisible: false
      ),
      body: const SafeArea(
        child: FavouriteViewBody(),
      ),
    );
  }
}

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: BlocProvider(
          create: (context) => ProductCubit(productRepo:getIt<ProductRepo>()),
          child: const BlocBuilderFavouriteProduct(),
        ),
      ),
    );
  }
}


class BlocBuilderFavouriteProduct extends StatefulWidget {
  const BlocBuilderFavouriteProduct({super.key});

  @override
  State<BlocBuilderFavouriteProduct> createState() =>
      _BlocBuilderFavouriteProductState();
}

class _BlocBuilderFavouriteProductState
    extends State<BlocBuilderFavouriteProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFavSuccess) {
          final product = state.products;
          return GridViewProduct(
            isHomeView: true,
            products: product,
            productsCount: product.length,
          );
        }
        else if (state is ProductFavError) {
          return Text(state.errorMessage);
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
