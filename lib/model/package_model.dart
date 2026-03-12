class PackageModel {
  final String packageId;
  final String packageTitle;
  final String packageDescription;
  final String packagePrice;
  final String packageDiscountPercent;
  final String packageValidityDays;
  final String packageIconPath;
  final String packageStatus;

  PackageModel(
    this.packageId,
    this.packageTitle,
    this.packageDescription,
    this.packagePrice,
    this.packageDiscountPercent,
    this.packageValidityDays,
    this.packageIconPath,
    this.packageStatus,
  );

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      (json['id'] ?? '').toString(),
      (json['title'] ?? '').toString(),
      (json['description'] ?? '').toString(),
      (json['price'] ?? '').toString(),
      (json['discount_percent'] ?? '').toString(),
      (json['validity_days'] ?? '').toString(),
      (json['icon_path'] ?? '').toString(),
      (json['status'] ?? '').toString(),
    );
  }
}
