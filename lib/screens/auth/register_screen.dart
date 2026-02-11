import 'package:flutter/material.dart';
import 'package:pedomatic_app/widgets/auth/image_section.dart';
import 'package:pedomatic_app/widgets/auth/register_form_section.dart';
import 'package:pedomatic_app/widgets/auth/welcome_text_section.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: const [
                ImageSection(),
                WelcomeTextSection(),
                RegisterFormSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
