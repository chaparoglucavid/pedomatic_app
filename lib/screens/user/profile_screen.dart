import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text("Profil"),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  child: Icon(Icons.person, size: 40),
                ),
                const SizedBox(height: 12),
                const Text(
                  "İstifadəçi Adı",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  "user@example.com",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
