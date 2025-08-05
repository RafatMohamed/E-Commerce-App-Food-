import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repo/Categry_repo/category_product_repo.dart';
import '../../../../core/service/get_it.dart';
import '../../logic/CategoryCubit/category_cubit.dart';
import 'bloc_builder_category_product.dart';

class ListViewCategoryProductBuilder extends StatelessWidget {
  const ListViewCategoryProductBuilder({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider(
  create: (context) => CategoryCubit(categoryProductRepo: getIt<CategoryProductRepo>(),),
  child: Builder(
        builder: (context) {
          return BlocBuilderCategoryProduct(size: size);
        }
    ),
);
  }
}

