import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pedomatic_app/screens/auth/register_screen.dart';
import 'package:pedomatic_app/widgets/buttons/login_button.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
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
                size: 18,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "********",
            suffixIcon: Transform.scale(
              scale: 0.5,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSecurityLock,
                size: 18,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: () {}, child: Text("Forget password")),
        ),
        SizedBox(height: 5),
        LoginButton(),
        const SizedBox(height: 10),

        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
          },
          child: const Text("Hesabın yoxdur? Qeydiyyatdan keç", style: TextStyle(color: Colors.pinkAccent),),
        ),
      ],
    );
  }
}
