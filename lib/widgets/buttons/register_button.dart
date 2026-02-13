import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: HugeIcon(icon: HugeIcons.strokeRoundedNoteDone),
      onPressed: () {
      },
      label: const Text("Register", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white
      ),
    );
  }
}
