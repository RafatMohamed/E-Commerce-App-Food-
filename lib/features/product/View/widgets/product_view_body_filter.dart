
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/images.dart' as assets;
import '../../../../core/widgets/custom_best_seller_body.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../Home/logic/ProductCubit/product_cubit.dart';

class ProductViewBodyFilter extends StatefulWidget {
  const ProductViewBodyFilter({
    super.key,
  });

  @override
  State<ProductViewBodyFilter> createState() => _ProductViewBodyFilterState();
}

class _ProductViewBodyFilterState extends State<ProductViewBodyFilter> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomSearchBar(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      color: Colors.white.withValues(alpha: 0.10),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0x66CACECE),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: SvgPicture.asset(assets.Assets.imagesFilter2),
                  ),
                ),
                Text("${context.read<ProductCubit>().productLength} نتائج ",
                  textDirection: TextDirection.ltr,
                  style: TextStyles.bold16.copyWith(
                      color: AppColor.grayscale950),),
              ],
            ),
            const Column(
              children: [
                SizedBox(height: 24),
                CustomBestSellerBody(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}