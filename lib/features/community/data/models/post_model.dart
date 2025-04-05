import 'comment_model.dart';

class PostModel {
  final String id;
  final String authorName;
  final String authorTitle;
  final String postTitle;
  final String content;
  final String imageUrl;
  List<CommentModel> comments;
  final bool isLiked;
  final int likeCount;

  PostModel({
    required this.id,
    required this.authorName,
    required this.authorTitle,
    required this.postTitle,
    required this.content,
    required this.imageUrl,
    this.isLiked = false,
    this.comments = const [],
    this.likeCount = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorName': authorName,
      'authorTitle': authorTitle,
      'postTitle': postTitle,
      'content': content,
      'imageUrl': imageUrl,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'isLiked': isLiked,
      'likeCount': likeCount,
    };
  }

  //from Map
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['\$id'],
      authorName: map['authorName'] ?? '',
      authorTitle: map['authorTitle'] ?? '',
      postTitle: map['postTitle'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      comments: (map['comments'] as List<dynamic>?)
              ?.map((commentJson) => CommentModel.fromMap(commentJson))
              .toList() ??
          [],
      likeCount: map['likeCount'] ?? 0,
      isLiked: map['isLiked'] ?? false,
    );
  }

  PostModel copyWith({
    String? id,
    String? authorName,
    String? authorTitle,
    String? postTitle,
    String? content,
    String? imageUrl,
    List<CommentModel>? comments,
    bool? isLiked,
    int? likeCount,
  }) {
    return PostModel(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
      authorTitle: authorTitle ?? this.authorTitle,
      postTitle: postTitle ?? this.postTitle,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}
