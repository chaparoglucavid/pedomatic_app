import 'package:pedomatic_app/services/api_service.dart';

class EquipmentService {
  final ApiService api = ApiService();

  Future<List> getEquipments() async {
    final response = await api.dio.get('/equipments');
    final data = response.data;
    if (data is Map && data.containsKey('data')) {
      return data['data'] as List;
    }
    return data as List;
  }
}
