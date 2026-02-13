import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationSection extends StatefulWidget {
  const BottomNavigationSection({super.key});

  @override
  State<BottomNavigationSection> createState() => _BottomNavigationSectionState();
}

class _BottomNavigationSectionState extends State<BottomNavigationSection> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.redAccent,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.pinkAccent, size: 35,),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined, color: Colors.pinkAccent, size: 35,),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: Colors.pinkAccent, size: 35,),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.forum, color: Colors.pinkAccent, size: 35,),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.pinkAccent, size: 35,),
            label: ""
        ),
      ],
    );
  }
}
