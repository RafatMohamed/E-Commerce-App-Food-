import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../Home/View/widgets/grid_view_product_builder.dart';
import '../../Home/logic/FavCubit/fav_cubit.dart';
import '../../Home/logic/FavCubit/fav_state.dart';

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

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<FavCubit>().fetchFavs();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          final favCubit = context.read<FavCubit>();
          if (state is FavError) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is FavLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = favCubit.favProducts;
          if (products.isEmpty) {
            return const Center(
              child: Text("لا توجد منتجات مفضلة بعد"),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: GridViewProduct(
              isHomeView: true,
              products: products,
              productsCount: products.length,
            ),
          );
        },
      ),
    );
  }
}
