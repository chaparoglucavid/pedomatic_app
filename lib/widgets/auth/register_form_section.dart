import 'package:flutter/material.dart';
import 'package:pedomatic_app/widgets/buttons/register_button.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey[600]),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.pinkAccent, width: 1.5),
      ),
      labelStyle: TextStyle(color: Colors.grey[600]),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: _buildInputDecoration("Email", Icons.email_outlined),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: _buildInputDecoration("Şifrə", Icons.lock_outline),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: _buildInputDecoration("Şifrəni təsdiqlə", Icons.lock_outline),
        ),
        const SizedBox(height: 24),
        const RegisterButton(),
        const SizedBox(height: 16),
      ],
    );
  }
}
