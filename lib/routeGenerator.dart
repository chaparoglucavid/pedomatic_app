import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/screens/auth/login_screen.dart';
import 'package:pedomatic_app/screens/user/404_page_not_found.dart';
import 'package:pedomatic_app/screens/user/equipment_details.dart';
import 'package:pedomatic_app/screens/user/home_screen.dart';
import 'package:pedomatic_app/screens/user/map_screen.dart';
import 'package:pedomatic_app/screens/user/forum_screen.dart';
import 'package:pedomatic_app/screens/user/profile_screen.dart';
import 'package:pedomatic_app/screens/user/qr_screen.dart';
import 'package:pedomatic_app/screens/user/dashboard_shell.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginScreen(),);

      case '/home-screen':
        return MaterialPageRoute(builder: (context) => DashboardShell(),);

      case '/map-screen':
        return MaterialPageRoute(builder: (context) => MapScreen(),);

      case '/qr-screen':
        return MaterialPageRoute(builder: (context) => QrScreen(),);

      case '/forum-screen':
        return MaterialPageRoute(builder: (context) => ForumScreen(),);

      case '/profile-screen':
        return MaterialPageRoute(builder: (context) => ProfileScreen(),);

      case '/equipment-details':
        return MaterialPageRoute(builder: (context) => EquipmentDetails(),);

      default:
        return MaterialPageRoute(builder: (context) => PageNotFoundScreen(),);
    }
  }
}
