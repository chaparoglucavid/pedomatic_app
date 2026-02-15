import 'package:flutter/material.dart';
import 'package:pedomatic_app/routeGenerator.dart';
import 'package:pedomatic_app/screens/auth/login_screen.dart';

void main() {
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
      home: LoginScreen(),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
