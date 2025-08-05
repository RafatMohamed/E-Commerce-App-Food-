import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/build_img_product.dart';
import '../../logic/CategoryCubit/category_cubit.dart';
import '../../logic/CategoryCubit/category_state.dart';

class BlocBuilderCategoryProduct extends StatefulWidget {
  const BlocBuilderCategoryProduct({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<BlocBuilderCategoryProduct> createState() => _BlocBuilderCategoryProductState();
}

class _BlocBuilderCategoryProductState extends State<BlocBuilderCategoryProduct> {
  @override
  void initState() {
    context.read<CategoryCubit>().fetchCategoryProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.15,
      child: RefreshIndicator(
        onRefresh: () {
         return context.read<CategoryCubit>().fetchCategoryProduct();
        },
        color: Colors.green,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is CategoryError) {
              return Text(state.errorMessage);
            }else if (state is CategorySuccess) {
              final categoryProducts = state.categories;
              return SizedBox(
                height: widget.size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProducts.length,
                  itemBuilder: (context, index) {
                    final categoryProduct = categoryProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          buildProductImage(imagePath: categoryProduct.imgUrl,isScaleCover: false,size: widget.size,),
                          const SizedBox(height: 8),
                          Text(
                            categoryProduct.name,
                            style: TextStyles.semiBold13.copyWith(color: AppColor
                                .grayscale950),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
