import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/equipment_details_sliver_app_bar.dart';
import 'package:pedomatic_app/model/equipments_model.dart';
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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEquipmentDetailsData();
  }

  void getEquipmentDetailsData() async {
    try {
      final data = await apiService.getEquipmentDetails(widget.id);

      debugPrint(data.toString());

      setState(() {
        equipment = data;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || equipment == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return MasterLayout(
      slivers: [
        EquipmentDetailsSliverAppBar(equipment: equipment!),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Kateqoriyalar",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: Image.asset('assets/images/categories/kotex.png'),
                    ),
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: Image.asset('assets/images/categories/molped.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}