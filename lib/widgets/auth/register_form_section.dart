import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pedomatic_app/widgets/buttons/register_button.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

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
        const SizedBox(height: 12),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Şifrəni təsdiqlə",
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
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
