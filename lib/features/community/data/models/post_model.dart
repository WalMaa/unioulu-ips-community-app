import 'comment_model.dart';
import 'dart:convert'; // Import this at the top

class PostModel {
  final String id;
  final String authorName;
  final String authorTitle;
  final String postTitle;
  final String content;
  final String imageUrl;
  final String pollQuestion; // Add this field
  List<CommentModel> comments;
  List<PollOption> pollOptions;
  final bool isLiked;
  final int likeCount;

  PostModel({
    required this.id,
    required this.authorName,
    required this.authorTitle,
    required this.postTitle,
    required this.content,
    required this.imageUrl,
    required this.pollQuestion, // Initialize here
    this.comments = const [],
    this.pollOptions = const [],
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['\$id'],
      authorName: json['authorName'] ?? '',
      authorTitle: json['authorTitle'] ?? '',
      postTitle: json['postTitle'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      pollQuestion: json['pollQuestion'] ?? '',
      comments: (json['comments'] as List<dynamic>?)
              ?.map((commentJson) => CommentModel.fromJson(commentJson))
              .toList() ??
          [],
      pollOptions: json['pollOptions'] is List
          ? (json['pollOptions'] as List<dynamic>)
              .map((optionJson) => optionJson is Map<String, dynamic>
                  ? PollOption.fromJson(optionJson)
                  : PollOption(option: optionJson.toString().trim()))
              .toList()
          : (json['pollOptions'] is String
              ? (json['pollOptions'] as String)
                  .split(',')
                  .map((option) => PollOption(option: option.trim()))
                  .toList()
              : []),
    );
  }
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
      'pollQuestion': pollQuestion, // Serialize pollQuestion
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'pollOptions': pollOptions.map((option) => option.toJson()).toList(),
    };
  }

  // Method to update the vote for a given poll option
  void updateVote(int index) {
    if (index >= 0 && index < pollOptions.length) {
      pollOptions[index].votes += 1;
    }
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

class PollOption {
  final String option;
  int votes;

  PollOption({required this.option, this.votes = 0});

  factory PollOption.fromJson(Map<String, dynamic> json) {
    return PollOption(
      option: json['option'] ?? '',
      votes: json['votes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option': option,
      'votes': votes,
    };
  }
}