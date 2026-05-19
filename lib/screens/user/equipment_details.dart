import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/equipment_details_sliver_app_bar.dart';
import 'package:pedomatic_app/model/category_model.dart';
import 'package:pedomatic_app/model/equipments_model.dart';
import 'package:pedomatic_app/screens/user/order_qr_display_screen.dart';
import 'package:pedomatic_app/services/api_service.dart';

class EquipmentDetails extends StatefulWidget {
  final String id;

  const EquipmentDetails({super.key, required this.id});

  @override
  State<EquipmentDetails> createState() => _EquipmentDetailsState();
}

class _EquipmentDetailsState extends State<EquipmentDetails> {
  final ApiService apiService = ApiService();

  EquipmentsModel? equipment;
  List<CategoryModel> categories = [];
  Map<int, int> selectedQuantities = {}; // subCategoryId -> quantity
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEquipmentDetailsData();
  }

  void getEquipmentDetailsData() async {
    try {
      final data = await apiService.getEquipmentDetails(widget.id);

      setState(() {
        equipment = EquipmentsModel.fromJson(data['equipment']);
        categories = (data['grouped_categories'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  double get totalAmount {
    double total = 0;
    for (var cat in categories) {
      for (var sub in cat.subCategories) {
        final qty = selectedQuantities[sub.id] ?? 0;
        total += qty * sub.unitPrice;
      }
    }
    return total;
  }

  void updateQuantity(int subCategoryId, int delta, int maxQty) {
    setState(() {
      final current = selectedQuantities[subCategoryId] ?? 0;
      final newValue = current + delta;
      if (newValue >= 0 && newValue <= maxQty) {
        selectedQuantities[subCategoryId] = newValue;
      }
    });
  }

  void _placeOrder(String paymentMethod) async {
    final orderItems = selectedQuantities.entries
        .where((e) => e.value > 0)
        .map((e) => {
              'categoryId': e.key,
              'quantity': e.value,
            })
        .toList();

    if (orderItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Zəhmət olmasa ən azı bir məhsul seçin')),
      );
      return;
    }

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final response = await apiService.placeOrder(
        deviceId: widget.id,
        orderItems: orderItems,
        paymentMethod: paymentMethod,
        totalAmount: totalAmount,
      );

      Navigator.pop(context); // Close loading

      if (response.statusCode == 201) {
        final order = response.data['order'];
        // Navigate to Order QR Display Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderQrDisplayScreen(order: order),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sifariş zamanı xəta: ${response.data['message']}')),
        );
      }
    } catch (e) {
      if (Navigator.canPop(context)) Navigator.pop(context); // Close loading if still open
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xəta baş verdi: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (equipment == null) {
      return const Scaffold(body: Center(child: Text("Cihaz tapılmadı")));
    }

    return MasterLayout(
      slivers: [
        EquipmentDetailsSliverAppBar(equipment: equipment!),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Məhsul Seçimi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...categories.map((category) => _buildCategorySection(category)),
                const SizedBox(height: 24),
                _buildOrderSummary(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCategorySection(CategoryModel category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.pinkAccent),
          ),
        ),
        ...category.subCategories.map((sub) => _buildSubCategoryItem(sub)),
        const Divider(),
      ],
    );
  }

  Widget _buildSubCategoryItem(SubCategoryModel sub) {
    final quantity = selectedQuantities[sub.id] ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          if (sub.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                sub.imageUrl!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                  Container(width: 60, height: 60, color: Colors.grey.shade300, child: const Icon(Icons.image_not_supported)),
              ),
            )
          else
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sub.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("${sub.unitPrice} AZN", style: TextStyle(color: Colors.grey.shade700)),
                Text("Ehtiyatda: ${sub.qtyAvailable}", style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: quantity > 0 ? () => updateQuantity(sub.id, -1, sub.qtyAvailable) : null,
                icon: const Icon(Icons.remove_circle_outline, color: Colors.pinkAccent),
              ),
              Text("$quantity", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: quantity < sub.qtyAvailable ? () => updateQuantity(sub.id, 1, sub.qtyAvailable) : null,
                icon: const Icon(Icons.add_circle_outline, color: Colors.pinkAccent),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    if (totalAmount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ümumi Məbləğ:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("${totalAmount.toStringAsFixed(2)} AZN", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _placeOrder('balance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Balansdan Ödə", textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _placeOrder('card'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Kartla Ödə", textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}