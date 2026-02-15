import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: HugeIcon(icon: HugeIcons.strokeRoundedLogin01),
      label: Text("Daxil olun", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home-screen');
      },
    );
  }
}
