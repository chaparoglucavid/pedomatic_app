import 'package:flutter/cupertino.dart';
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                ImageSection(),
                WelcomeTextSection(),
                LoginFormSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
