import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/screens/auth/login_screen.dart';
import 'package:pedomatic_app/screens/user/404_page_not_found.dart';
import 'package:pedomatic_app/screens/user/equipment_details.dart';
import 'package:pedomatic_app/screens/user/home_screen.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginScreen(),);

      case '/home-screen':
        return MaterialPageRoute(builder: (context) => HomeScreen(),);

      case '/equipment-details':
        return MaterialPageRoute(builder: (context) => EquipmentDetails(),);

      default:
        return MaterialPageRoute(builder: (context) => PageNotFoundScreen(),);
    }
  }
}