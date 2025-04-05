class CommentModel {
  final String id;
  final String postId;
  final String text;
  final String username;
  final DateTime dateTime;
  final bool isLiked;
  final int likeCount;

  CommentModel({
    required this.id,
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
      id: map['\$id'] ?? '',
      postId: map['postId'] ?? '',
      text: map['text'] ?? '',
      username: map['username'] ?? 'Anonymous',
      dateTime: DateTime.parse(map['dateTime']),
      isLiked: map['isLiked'] ?? false,
      likeCount: map['likeCount'] ?? 0,
    );
  }

  CommentModel copyWith({
    String? id,
    String? postId,
    String? text,
    String? username,
    DateTime? dateTime,
    bool? isLiked,
    int? likeCount,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      text: text ?? this.text,
      username: username ?? this.username,
      dateTime: dateTime ?? this.dateTime,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}
