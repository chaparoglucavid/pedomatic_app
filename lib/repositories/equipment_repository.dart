import 'dart:convert';

import 'package:pedomatic_app/model/equipments_model.dart';
import 'package:pedomatic_app/services/equipment_service.dart';

class EquipmentRepository {
  final EquipmentService equipmentService = EquipmentService();

  Future<List<EquipmentsModel>> fetchEquipments() async {
    final data = await equipmentService.getEquipments();

    return data
        .map<EquipmentsModel>((json) => EquipmentsModel.fromJson(json))
        .toList();
  }
}
