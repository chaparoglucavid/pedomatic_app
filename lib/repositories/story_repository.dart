import 'package:pedomatic_app/model/stories_model.dart';
import 'package:pedomatic_app/services/story_service.dart';

class StoryRepository {
  final StoryService storyService = StoryService();

  Future<List<StoriesModel>> fetchStories() async {
    final data = await storyService.getStories();

    return data
        .map<StoriesModel>((json) => StoriesModel.fromJson(json))
        .toList();
  }
}