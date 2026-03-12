class PackageModel {
  final String packageId;
  final String packageTitle;
  final String packageDescription;
  final String packagePrice;
  final String packageDiscountPercent;
  final String packageValidityDays;
  final String packageIconPath;
  final int orderIndex;
  final bool isPopular;
  final String badgeText;
  final List<PackageFeatureModel> features;
  final String packageStatus;

  PackageModel(
    this.packageId,
    this.packageTitle,
    this.packageDescription,
    this.packagePrice,
    this.packageDiscountPercent,
    this.packageValidityDays,
    this.packageIconPath,
    this.orderIndex,
    this.isPopular,
    this.badgeText,
    this.features,
    this.packageStatus,
  );

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    var featuresList = json['features'] as List? ?? [];
    List<PackageFeatureModel> features = featuresList
        .map((f) => PackageFeatureModel.fromJson(f as Map<String, dynamic>))
        .toList();

    return PackageModel(
      (json['id'] ?? '').toString(),
      (json['title'] ?? '').toString(),
      (json['description'] ?? '').toString(),
      (json['price'] ?? '').toString(),
      (json['discount_percent'] ?? '').toString(),
      (json['validity_days'] ?? '').toString(),
      (json['icon_path'] ?? '').toString(),
      int.tryParse((json['order_index'] ?? '0').toString()) ?? 0,
      json['is_popular'] == 1 || json['is_popular'] == true,
      (json['badge_text'] ?? '').toString(),
      features,
      (json['status'] ?? '').toString(),
    );
  }
}

class PackageFeatureModel {
  final String name;
  final String value;

  PackageFeatureModel(this.name, this.value);

  factory PackageFeatureModel.fromJson(Map<String, dynamic> json) {
    return PackageFeatureModel(
      (json['name'] ?? '').toString(),
      (json['value'] ?? '').toString(),
    );
  }
}
