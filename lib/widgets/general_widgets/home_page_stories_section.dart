import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/helpers/general_helpers.dart';
import 'package:pedomatic_app/model/stories_model.dart';
import 'package:pedomatic_app/repositories/story_repository.dart';

class HomePageStoriesSection extends StatefulWidget {
  const HomePageStoriesSection({super.key});

  @override
  State<HomePageStoriesSection> createState() =>
      _HomePageStoriesSectionState();
}

class _HomePageStoriesSectionState extends State<HomePageStoriesSection> {
  final repository = StoryRepository();
  List<StoriesModel> stories = [];

  void loadStories() async {
    final data = await repository.fetchStories();
    setState(() {
      stories = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadStories();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(

      child: SizedBox(
        height: 185,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final story = stories[index];

            debugPrint(story.storyImagePath);

            return SizedBox(
              width: 90,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        story.storyImagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    story.storyTitle,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Stories {
  int? id;
  String? title;
  String? content;
  String? image;

  Stories(this.id, this.title, this.content, this.image);
}
