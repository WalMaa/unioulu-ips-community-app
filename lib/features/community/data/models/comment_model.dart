class CommentModel {
  final String postId;
  final String text;
  final String username;
  final DateTime dateTime;
  final bool isLiked;
  final int likeCount;

  CommentModel({
    required this.postId,
    required this.text,
    required this.username,
    required this.dateTime,
    this.isLiked = false,
    this.likeCount = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'text': text,
      'username': username,
      'dateTime': dateTime.toIso8601String(),
      'isLiked': isLiked,
      'likeCount': likeCount,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      postId: map['postId'] ?? '', // Ensure postId is included in the comment
      text: map['text'] ?? '',
      username: map['username'] ?? 'Anonymous',
      dateTime: DateTime.parse(map['dateTime']),
      isLiked: map['isLiked'] ?? false,
      likeCount: map['likeCount'] ?? 0,
    );
  }
}
