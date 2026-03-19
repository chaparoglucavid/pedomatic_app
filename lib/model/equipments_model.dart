import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EquipmentsModel {
  final String equipmentId;
  final String equipmentName;
  final String equipmentNumber;
  final String equipmentAddress;
  final String equipmentLongitude;
  final String equipmentLatitude;
  final String equipmentStatus;
  final String equipmentCurrentPedCount;
  final String equipmentPedCapacity;
  final String equipmentCurrentBatteryLevel;

  EquipmentsModel(
    this.equipmentId,
    this.equipmentName,
    this.equipmentNumber,
    this.equipmentAddress,
    this.equipmentLongitude,
    this.equipmentLatitude,
    this.equipmentStatus,
    this.equipmentCurrentPedCount,
    this.equipmentPedCapacity,
    this.equipmentCurrentBatteryLevel,
  );

  factory EquipmentsModel.fromJson(Map<String, dynamic> json) {
    return EquipmentsModel(
      (json['id'] ?? '').toString(),
      (json['equipment_name'] ?? '').toString(),
      (json['equipment_number'] ?? '').toString(),
      (json['current_address'] ?? '').toString(),
      (json['longitude'] ?? '').toString(),
      (json['latitude'] ?? '').toString(),
      (json['equipment_status'] ?? '').toString(),
      (json['current_ped_count'] ?? '').toString(),
      (json['general_capacity'] ?? '').toString(),
      (json['battery_level'] ?? '').toString(),
    );
  }

  //'active', 'deactive', 'under_repair', 'maintenance', 'offline', 'broken'
  Icon convertedStatus(equipmentStatus) {
    switch (equipmentStatus) {
      case "active":
        return Icon(Icons.check_circle, size: 16,  color: Colors.white,);

      case "deactive":
        return Icon(Icons.cancel, size: 16,  color: Colors.white,);

      case "under_repair":
        return Icon(Icons.build, size: 16,  color: Colors.white,);

      case "maintenance":
        return Icon(Icons.settings, size: 16,  color: Colors.white,);

      case "offline":
        return Icon(Icons.cloud_off, size: 16,  color: Colors.white,);

      case "broken":
        return Icon(Icons.error, size: 16,  color: Colors.white,);

      default:
        return Icon(Icons.help_outline, size: 16,  color: Colors.white,);
    }
  }

  @override
  String toString() {
    return 'EquipmentsModel(id: $equipmentId, name: $equipmentName, number: $equipmentNumber, ped: $equipmentCurrentPedCount, status: $equipmentStatus)';
  }
}
