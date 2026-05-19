import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pedomatic_app/routeGenerator.dart';
import 'package:pedomatic_app/screens/auth/step1_screen.dart';
import 'package:pedomatic_app/screens/user/dashboard_shell.dart';
import 'package:pedomatic_app/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final box = await Hive.openBox('userInformations');
  runApp(MyApp(box: box));
}

class MyApp extends StatelessWidget {
  final Box box;
  const MyApp({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    // Session management logic
    Widget initialScreen;
    final token = box.get('token');
    final isRegistered = box.get('isRegistered', defaultValue: false);

    if (token != null) {
      initialScreen = DashboardShell();
    } else if (isRegistered) {
      initialScreen = const LoginScreen();
    } else {
      initialScreen = const Step1Screen();
    }

    return MaterialApp(
      title: 'Pedomat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: initialScreen,
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
