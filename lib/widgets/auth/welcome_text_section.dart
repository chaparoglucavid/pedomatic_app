import 'package:flutter/material.dart';
import 'package:pedomatic_app/widgets/auth/social_media_icons_section.dart';

class WelcomeTextSection extends StatelessWidget {
  const WelcomeTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Pedomatic",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 14,
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text:
                  "Pedomat app sizi salamlayır! Bizə qoşulmaqla siz ",
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      // Terms səhifəsinə keçid
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      child: const Text(
                        "İstifadəçi razılaşması",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text: "nı qəbul etmiş olursunuz.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
