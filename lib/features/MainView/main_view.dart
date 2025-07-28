import 'package:flutter/material.dart';
import '../../core/widgets/default_bottom_nav_bar.dart';
import '../Home/View/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'mainView';
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const Placeholder(), //ProductsView(),
    const Placeholder(), // ShoppingCartView(),
    const Placeholder(), // ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: DefaultBottomNavigationBar(
                currentIndex: currentIndex,
                onCurrentIndexChange:(index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )
          ),
        ],
      ),
    );
  }
}