import 'package:flutter/material.dart';
import 'package:pedomatic_app/widgets/buttons/register_button.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: _buildInputDecoration("Email", Icons.email_outlined),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email boş ola bilməz";
              }
              if (!value.contains("@")) {
                return "Email düzgün deyil";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: _buildInputDecoration("Şifrə", Icons.lock_outline),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Şifrə boş ola bilməz";
              }
              if (value.length < 6) {
                return "Şifrə minimum 6 simvol olmalıdır";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: _buildInputDecoration("Şifrəni təsdiqlə", Icons.lock_outline),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Şifrə təsdiqi boş ola bilməz";
              }
              if (value != _passwordController.text) {
                return "Şifrələr uyğun deyil";
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: _submitForm,
            child: const RegisterButton(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}