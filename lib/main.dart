import 'package:flutter/material.dart';

import 'App/my_app.dart';
import 'core/service/StorageLocal/SharedPrefs.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefesStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const FruitsApp();
  }
}
