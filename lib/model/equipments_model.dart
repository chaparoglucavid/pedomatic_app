class EquipmentsModel {
  late final int equipmentId;
  late final String equipmentName;
  late final String equipmentNumber;
  late final String equipmentAddress;
  late final double equipmentLongitude;
  late final double equipmentLatitude;
  late final bool equipmentStatus;
  late final int equipmentCurrentPedCount;
  late final int equipmentPedCapacity;
  late final int equipmentCurrentBatteryLevel;

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
}

List<EquipmentsModel> equipmentData = [
  EquipmentsModel(1,'28 Mall', '120101030', '25, 50 Azadlıq Prospekti, Bakı', 44.7833, 41.7163, true, 34, 60, 84),
  EquipmentsModel(2,'ADA universiteti', '190445698', 'Əhməd bəy Ağaoglu, Bakı', 49.8676, 40.3944, true, 48, 60, 90),
];
