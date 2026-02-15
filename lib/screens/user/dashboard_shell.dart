import 'package:flutter/material.dart';
import 'package:pedomatic_app/screens/user/home_screen.dart';
import 'package:pedomatic_app/screens/user/map_screen.dart';
import 'package:pedomatic_app/screens/user/qr_screen.dart';
import 'package:pedomatic_app/screens/user/forum_screen.dart';
import 'package:pedomatic_app/screens/user/profile_screen.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MapScreen(),
    QrScreen(),
    ForumScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Ana səhifə",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Xəritə",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "QR",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: "Forum",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
