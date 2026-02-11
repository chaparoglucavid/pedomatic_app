import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNavigationSection extends StatefulWidget {
  const BottomNavigationSection({super.key});

  @override
  State<BottomNavigationSection> createState() => _BottomNavigationSectionState();
}

class _BottomNavigationSectionState extends State<BottomNavigationSection> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome02,
              color: Colors.pinkAccent,
            ),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedMapPin,
              color: Colors.pinkAccent,
            ),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedQrCode01,
              color: Colors.pinkAccent,
            ),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedBubbleChatAdd,
              color: Colors.pinkAccent,
            ),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedProfile,
              color: Colors.pinkAccent,
            ),
            label: ""
        ),
      ],
    );
  }
}
