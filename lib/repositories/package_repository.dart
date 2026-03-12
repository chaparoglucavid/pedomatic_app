import 'package:pedomatic_app/model/equipments_model.dart';
import 'package:pedomatic_app/model/package_model.dart';
import 'package:pedomatic_app/services/package_service.dart';

class PackageRepository {

  final PackageService packageService = PackageService();

  Future<List<PackageModel>> fetchPackages() async {
    final data = await packageService.getPackages();

    return data
        .map<PackageModel>((json) => PackageModel.fromJson(json)).toList();
  }

}