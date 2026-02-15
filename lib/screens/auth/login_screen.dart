import 'package:flutter/material.dart';
import 'package:pedomatic_app/widgets/auth/image_section.dart';
import 'package:pedomatic_app/widgets/auth/login_form_section.dart';
import 'package:pedomatic_app/widgets/auth/welcome_text_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  ImageSection(),
                  SizedBox(height: 16),
                  WelcomeTextSection(),
                  SizedBox(height: 24),
                  LoginFormSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
