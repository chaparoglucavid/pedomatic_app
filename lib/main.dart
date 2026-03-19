import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pedomatic_app/routeGenerator.dart';
import 'package:pedomatic_app/screens/auth/step1_screen.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('userInformations');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedomat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Step1Screen(),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
