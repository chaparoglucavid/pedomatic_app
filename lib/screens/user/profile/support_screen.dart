import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MasterLayout(
        slivers: [
          const SliverAppBar(
            title: Text("Texniki dəstək"),
            pinned: true,
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const TabBar(
                    tabs: [
                      Tab(text: "FAQ"),
                      Tab(text: "Chat"),
                      Tab(text: "Ticket"),
                    ],
                  ),
                ),

                SizedBox(
                  height: 500, // lazımdır, Expanded olmaz
                  child: TabBarView(
                    children: const [
                      Center(child: Text("FAQ")),
                      Center(child: Text("Chat")),
                      Center(child: Text("Ticket")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}