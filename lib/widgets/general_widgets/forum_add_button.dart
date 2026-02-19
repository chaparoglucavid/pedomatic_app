import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ForumAddButton extends StatelessWidget {
  const ForumAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Forum paylaş"),
              icon: const HugeIcon(
                icon: HugeIcons.strokeRounded1Circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
