import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/snacbar_meesage.dart';

import '../../cart/logic/cart_cubit.dart';

class BlocProviderBody extends StatelessWidget {
  const BlocProviderBody({
    super.key,
    required int currentIndex,
    required List<Widget> screens,
  })
      : _currentIndex = currentIndex,
        _screens = screens;

  final int _currentIndex;
  final List<Widget> _screens;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddSuccess) {
showSnackBarMessage(context: context, message: 'Product added to cart');
        }
        if (state is CartRemoveSuccess) {
showSnackBarMessage(context: context, message: 'Product removed from cart')   ;
        }
      },
      child: IndexedStack(index: _currentIndex, children: _screens),
    );
  }
}
