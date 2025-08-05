import 'package:flutter/material.dart';
import 'package:food_app/features/product/View/product_view.dart';
import '../../core/widgets/default_bottom_nav_bar.dart';
import '../Home/View/home_view.dart';
class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'mainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeView(),
    const ProductView(), //ProductsView(),
    const Placeholder(), // ShoppingCartView(),
    const Placeholder(), // ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: _currentIndex, children: _screens),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: DefaultBottomNavigationBar(
              currentIndex: _currentIndex,
              onCurrentIndexChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
