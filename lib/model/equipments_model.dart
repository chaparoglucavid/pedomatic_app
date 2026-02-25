class EquipmentsModel {
  late final String _equipmentName;
  late final String _equipmentNumber;
  late final String _equipmentAddress;
  late final double _equipmentLongitude;
  late final double _equipmentLatitude;
  late final bool _equipmentStatus;
  late final int _equipmentCurrentPedCount;
  late final int _equipmentPedCapacity;
  late final int _equipmentCurrentBatteryLevel;

  EquipmentsModel(
    this._equipmentName,
    this._equipmentNumber,
    this._equipmentAddress,
    this._equipmentLongitude,
    this._equipmentLatitude,
    this._equipmentStatus,
    this._equipmentCurrentPedCount,
    this._equipmentPedCapacity,
    this._equipmentCurrentBatteryLevel,
  );
}
