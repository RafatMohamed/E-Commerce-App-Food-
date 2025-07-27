import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Text("Home View",style: Theme.of(context).textTheme.headlineLarge,),
                ],
              ),
            ),
    );
  }
}