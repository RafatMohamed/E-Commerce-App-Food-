import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/images.dart' as assets;
import '../../../../core/widgets/custom_bloc_provider_best_seller.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../filter_category_product_view.dart';
import 'list_view_category.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
                  onTap: () {
                    Navigator.pushNamed(context, FilterCategoryProductView.routeName);
                  },
                  child:Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                Text("منتجاتنا",
                  style: TextStyles.bold16.copyWith(color: AppColor.grayscale950),),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(height:size.height*0.15,child: const ListViewCategoryProductBuilder()),
            const Column(
              children: [
                SizedBox(height: 24),
                BlocProviderBestSeller(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}