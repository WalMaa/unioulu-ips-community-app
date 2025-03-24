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

  PostModel({
    required this.id,
    required this.authorName,
    required this.authorTitle,
    required this.postTitle,
    required this.content,
    required this.imageUrl,
    this.isLiked = false, // Default to not liked
    this.comments = const [], // Initialize with an empty list by default
  });

  // Factory constructor to create from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['\$id'],
      authorName: json['authorName'] ?? '',
      authorTitle: json['authorTitle'] ?? '',
      postTitle: json['postTitle'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      comments: (json['comments'] as List<dynamic>?)
              ?.map((commentJson) => CommentModel.fromJson(commentJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorName': authorName,
      'authorTitle': authorTitle,
      'postTitle': postTitle,
      'content': content,
      'imageUrl': imageUrl,
      'comments': comments.map((comment) => comment.toJson()).toList(),
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
    );
  }
}
