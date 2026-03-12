import 'package:pedomatic_app/model/stories_model.dart';
import 'package:pedomatic_app/services/api_service.dart';

class StoryService {
  final ApiService api = ApiService();

  Future<List> getStories() async {
    final response = await api.dio.get('/stories');
    final data = response.data;
    if (data is Map && data.containsKey('data')) {
      return data['data'] as List;
    }
    return data as List;
  }

}