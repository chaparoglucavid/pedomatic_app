import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text("QR skan"),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 32),
        ),
        const SliverToBoxAdapter(
          child: Center(
            child: Icon(
              Icons.qr_code_2,
              size: 96,
              color: Colors.grey,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Tezliklə: QR kodu skan edərək pedomatları daha sürətli aktiv edə biləcəksiniz.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
