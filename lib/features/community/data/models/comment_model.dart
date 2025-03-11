class CommentModel {
  final String postId; // ID of the post the comment belongs to
  final String text;
  final String username;
  final DateTime dateTime;

  CommentModel({
    required this.postId,
    required this.text,
    required this.username,
    required this.dateTime,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json['postId'] ?? '', // Ensure postId is included in the comment
      text: json['text'] ?? '',
      username: json['username'] ?? 'Anonymous',
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId, // Include posts relationship when serializing to JSON
      'text': text,
      'username': username,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
