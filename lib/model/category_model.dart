class CategoryModel {
  final int id;
  final String name;
  final List<SubCategoryModel> subCategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      subCategories: (json['sub_categories'] as List? ?? [])
          .map((i) => SubCategoryModel.fromJson(i))
          .toList(),
    );
  }
}

class SubCategoryModel {
  final int id;
  final String name;
  final double unitPrice;
  final int qtyAvailable;
  final String? imageUrl;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.qtyAvailable,
    this.imageUrl,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      unitPrice: double.tryParse(json['unit_price'].toString()) ?? 0.0,
      qtyAvailable: json['qty_available'] ?? 0,
      imageUrl: json['image_url'],
    );
  }
}
