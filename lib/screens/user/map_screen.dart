import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text("Xəritə"),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 40),
        ),
        const SliverToBoxAdapter(
          child: Center(
            child: Icon(
              Icons.map_outlined,
              size: 80,
              color: Colors.grey,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Tezliklə: interaktiv xəritə üzərindən pedomatları görəcəksiniz.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
