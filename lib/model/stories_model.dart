class StoriesModel {
  final String storyId;
  final String storyTitle;
  final String storyContent;
  final String storyImagePath;

  StoriesModel(this.storyId, this.storyTitle, this.storyContent, this.storyImagePath);

  factory StoriesModel.fromJson(Map<String, dynamic> json){
    return StoriesModel(
      (json['id'] ?? '').toString(),
      (json['title'] ?? '').toString(),
      (json['content'] ?? '').toString(),
      (json['image'] ?? '').toString(),
    );
  }

  @override
  String toString() {
    return 'StoriesModel(id: $storyId, title: $storyTitle, content: $storyContent, image: $storyImagePath)';
  }
}