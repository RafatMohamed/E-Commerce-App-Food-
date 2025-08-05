import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/Home/logic/ProductCubit/product_cubit.dart';
import '../../../core/constant.dart';
import '../../../core/repo/Product_repo/product_repo.dart';
import '../../../core/service/get_it.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/fetch_product_view_body.dart';

class BestSellersView extends StatelessWidget {
  const BestSellersView({super.key});

  static const String routeName = "Best Sellers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "الاكثر مبيعا"),
      body: BlocProvider(
        create: (context) => ProductCubit(productRepo: getIt<ProductRepo>(),),
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "الاكثر مبيعا",
                      style: TextStyles.bold16.copyWith(
                          color: AppColor.grayscale950),
                    ),
                    const SizedBox(height: 10),
                    const Expanded(
                      child: BlocBuilderFetchProductViewView(),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

