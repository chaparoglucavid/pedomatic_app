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
  String convertedStatus(equipmentStatus) {
    switch (equipmentStatus) {
      case "active":
        return "Aktiv";
      case "deactive":
        return "Deaktiv";
      case "under_repair":
        return "Təmirdədir";
      case "maintenance":
        return "Texniki dəstək göstərilir";
      case "offline":
        return "Oflayn";
      case "broken":
        return "Zədəlidir";
      default:
        return "Aktiv";
    }
  }

  @override
  String toString() {
    return 'EquipmentsModel(id: $equipmentId, name: $equipmentName, number: $equipmentNumber, ped: $equipmentCurrentPedCount, status: $equipmentStatus)';
  }
}
