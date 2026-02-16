import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text("QR Scan"),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400,
            child: MobileScanner(

            ),
          ),
        ),
      ],
    );
  }
}
