import 'package:flutter/material.dart';

class BottomNavigationSection extends StatefulWidget {
  const BottomNavigationSection({super.key});

  @override
  State<BottomNavigationSection> createState() => _BottomNavigationSectionState();
}

class _BottomNavigationSectionState extends State<BottomNavigationSection> {
  int _currentIndexForRoute(BuildContext context) {
    final name = ModalRoute.of(context)?.settings.name;
    switch (name) {
      case '/home-screen':
        return 0;
      case '/map-screen':
        return 1;
      case '/qr-screen':
        return 2;
      case '/forum-screen':
        return 3;
      case '/profile-screen':
        return 4;
      default:
        return 0;
    }
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home-screen');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/map-screen');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/qr-screen');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/forum-screen');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile-screen');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndexForRoute(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.pinkAccent,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) => _onTap(context, index),
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
    );
  }
}
