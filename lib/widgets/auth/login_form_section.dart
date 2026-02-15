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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Şifrə",
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: () {}, child: Text("Forget password")),
        ),
        const SizedBox(height: 5),
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
