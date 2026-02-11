import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pedomatic_app/screens/auth/login_screen.dart';
import 'package:pedomatic_app/widgets/buttons/register_button.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            suffixIcon: Transform.scale(
              scale: 0.5,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedAiMail01,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Şifrə",
            suffixIcon: Transform.scale(
              scale: 0.5,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSecurityLock,
                color: Colors.pinkAccent,
              ),
            )
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Şifrəni təsdiqlə",
            suffixIcon: Transform.scale(
              scale: 0.5,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSecurityLock,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        RegisterButton(),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Hesabın var? Daxil ol", style: TextStyle(color: Colors.pinkAccent),),
        ),
      ],
    );
  }
}
