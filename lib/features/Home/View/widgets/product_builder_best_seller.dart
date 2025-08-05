
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/ProductCubit/product_cubit.dart';
import '../../logic/ProductCubit/product_state.dart';
import 'grid_view_product_builder.dart';

class BlocBuilderBestSeller extends StatefulWidget {
  const BlocBuilderBestSeller({
    super.key,
  });

  @override
  State<BlocBuilderBestSeller> createState() => _BlocBuilderBestSellerState();
}

class _BlocBuilderBestSellerState extends State<BlocBuilderBestSeller> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProductBestSeller();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          final product = state.products;
          return  GridViewProduct(
            isHomeView: true,
            products: product,
            productsCount: product.length,
          );
        }
        else if (state is ProductError) {
          return Text(state.errorMessage);
        }
        if (state is ProductSuccess) {
          final product = state.products;
          return  GridViewProduct(
            isHomeView: false,
            products: product,
            productsCount: product.length,
          );
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}