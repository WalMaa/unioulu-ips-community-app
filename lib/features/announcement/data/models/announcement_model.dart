class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;

  AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  // Factory constructor to create from JSON
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['\$id'],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
    };
  }
}
