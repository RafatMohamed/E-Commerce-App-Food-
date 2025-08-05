import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/Home/logic/ProductCubit/product_cubit.dart';
import '../repo/Product_repo/product_repo.dart';
import '../service/get_it.dart';
import 'custom_best_seller_body.dart';

class BlocProviderBestSeller extends StatelessWidget {
  const BlocProviderBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(productRepo: getIt<ProductRepo>(),),
      child: const CustomBestSellerBody(),
    );
  }
}
