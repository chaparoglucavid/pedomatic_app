import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SocialMediaIconsSection extends StatefulWidget {
  const SocialMediaIconsSection({super.key});

  @override
  State<SocialMediaIconsSection> createState() => _SocialMediaIconsSectionState();
}

class _SocialMediaIconsSectionState extends State<SocialMediaIconsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedFacebook02, color: Colors.blue,),
          HugeIcon(icon: HugeIcons.strokeRoundedInstagram, color: Colors.pink,),
          HugeIcon(icon: HugeIcons.strokeRoundedTiktok),
          HugeIcon(icon: HugeIcons.strokeRoundedLinkedin02),
        ],
      ),
    );
  }
}
