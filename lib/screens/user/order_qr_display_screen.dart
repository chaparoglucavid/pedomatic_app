import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class OrderQrDisplayScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderQrDisplayScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final barcodeData = order['barcode'] ?? '';
    final orderNumber = order['order_number'] ?? '';
    final expiryTime = order['barcode_expiry_time'] ?? '';

    // The barcode data from the backend is 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...'
    final base64String = barcodeData.startsWith('data:image/png;base64,')
        ? barcodeData.substring(22)
        : barcodeData;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sifariş QR Kodu"),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sifariş No: $orderNumber",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              if (base64String.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
                    ],
                  ),
                  child: Image.memory(
                    base64Decode(base64String),
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                )
              else
                const Icon(Icons.error_outline, size: 100, color: Colors.grey),
              const SizedBox(height: 30),
              const Text(
                "Bu QR kodu cihazın skanerləyicisinə göstərin.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Text(
                "Müddəti bitir: $expiryTime",
                style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Ana Səhifəyə Qayıt"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
