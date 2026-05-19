import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pedomatic_app/services/api_service.dart';
import 'package:pedomatic_app/widgets/buttons/login_button.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final ApiService api = ApiService();
  String _email = '', _password = '';
  final formKey = GlobalKey<FormState>();

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
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: _buildInputDecoration("Email", Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            onSaved: (emailValue) {
              _email = emailValue!;
            },
            validator: (emailValue) {
              if (!EmailValidator.validate(emailValue!)) {
                return 'Zəhmət olmasa email ünvanının doğruluğunu yoxlayın.';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: _buildInputDecoration("Şifrə", Icons.lock_outline),
            onSaved: (passwordValue) {
              _password = passwordValue!;
            },
            validator: (passwordValue) {
              if (passwordValue!.length < 6) {
                return 'Şifrə uzunluğu minimum 6 olmalıdır';
              } else
                return null;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Şifrəni unutmusunuz?",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          LoginButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                try {
                  final response = await api.login(
                    email: _email,
                    password: _password,
                  );

                  if (response.statusCode == HttpStatus.ok) {
                    final token = response.data['token'];
                    final box = Hive.box('userInformations');
                    await box.put('token', token);
                    await box.put('user', response.data['user']);

                    Navigator.pushNamed(context, '/home-screen');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        elevation: 5,
                        showCloseIcon: true,
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "Zəhmət olmasa məlumatların doğruluğunu yoxlayın.",
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text("Xəta baş verdi: $e"),
                    ),
                  );
                }
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
