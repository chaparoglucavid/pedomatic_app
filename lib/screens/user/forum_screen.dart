import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text("Forum"),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Tezliklə: Suallarınızı bölüşə və digər istifadəçilərlə müzakirə apara biləcəksiniz.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
