import 'package:pedomatic_app/services/api_service.dart';

class PackageService {
  final ApiService api = ApiService();

  Future<List> getPackages () async {
    final response = await api.dio.get('/packages');
    final data = response.data;

    if (data is Map && data.containsKey('data')) {
      return data['data'] as List;
    }
    return data as List;
  }
}