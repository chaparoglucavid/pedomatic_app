import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/partials/bottom_navigation_section.dart';

class MasterLayout extends StatelessWidget {
  final List<Widget> slivers;

  const MasterLayout({super.key, required this.slivers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: slivers),
      bottomNavigationBar: BottomNavigationSection(),
    );
  }
}
