import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'App/my_app.dart';
import 'core/service/StorageLocal/shared_prefs.dart';
import 'core/service/get_it.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  await PrefsStorage.init();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const FruitsApp();
  }
}
