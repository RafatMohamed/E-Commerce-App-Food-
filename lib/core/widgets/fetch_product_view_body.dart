import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/Home/View/widgets/grid_view_product_builder.dart';
import '../../features/Home/logic/ProductCubit/product_cubit.dart';
import '../../features/Home/logic/ProductCubit/product_state.dart';
import '../../features/cart/logic/cart_cubit.dart';

class BlocBuilderFetchProductViewView extends StatefulWidget {
  const BlocBuilderFetchProductViewView({
    super.key,
  });

  @override
  State<BlocBuilderFetchProductViewView> createState() =>
      _BlocBuilderFetchProductViewViewState();
}

class _BlocBuilderFetchProductViewViewState extends State<BlocBuilderFetchProductViewView> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = context.watch<CartCubit>();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          final product = state.products;
          return GridViewProduct(
            isHomeView: false,
            products:product,
            productsCount: cartModel.cartModel.cartItem.length,
          );
        }
        else if (state is ProductError) {
          return Text(state.errorMessage);
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
