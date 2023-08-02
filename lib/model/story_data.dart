



class StoryData {
  final String by;
  final int id;
  final List<int> kids;
  final String title;
  final String text;

  StoryData({
    required this.by,
    required this.id,
    required this.kids,
    required this.title,
    required this.text,
  });

  factory StoryData.fromJson(Map<String, dynamic> json) {
    return StoryData(
      by: json['by'] ?? '',
      id: json['id'] ?? '',
      kids: json['kids'] ?? '',
      title: json['title'] ?? '',
      text: json['text'] ?? '',
    );
  }
}


