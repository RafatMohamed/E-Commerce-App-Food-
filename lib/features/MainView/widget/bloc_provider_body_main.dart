import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to cart')));
        }
        if (state is CartRemoveSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product removed from cart')));
        }
      },
      child: IndexedStack(index: _currentIndex, children: _screens),
    );
  }
}
