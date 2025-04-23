import 'dart:convert';
import 'comment_model.dart';

class PostModel {
  final String id;
  final String authorName;
  final String authorTitle;
  final String postTitle;
  final String content;
  final String imageUrl;
  final String pollQuestion;
  final List<CommentModel> comments;
  final List<PollOption> pollOptions;
  final bool isLiked;
  final int likeCount;

  PostModel({
    required this.id,
    required this.authorName,
    required this.authorTitle,
    required this.postTitle,
    required this.content,
    required this.imageUrl,
    required this.pollQuestion,
    this.comments = const [],
    this.pollOptions = const [],
    this.isLiked = false,
    this.likeCount = 0,
  });

  factory PostModel.fromMap(Map<String, dynamic> json) {
    List<CommentModel> commentsList = [];
    if (json['comments'] is List) {
      commentsList = (json['comments'] as List<dynamic>)
          .map((c) => CommentModel.fromMap(c as Map<String, dynamic>))
          .toList();
    } else if (json['comments'] is String) {
      try {
        final decodedComments = jsonDecode(json['comments'] as String);
        if (decodedComments is List) {
          commentsList = decodedComments
              .map((c) => CommentModel.fromMap(c as Map<String, dynamic>))
              .toList();
        }
      } catch (e) {
        // Handle or log decoding error if necessary
        print('Error decoding comments string: $e');
      }
    }

    List<PollOption> pollOptionsList = [];
    if (json['pollOptions'] is List) {
      pollOptionsList = (json['pollOptions'] as List<dynamic>)
          .map((o) => PollOption.fromJson(o is Map<String, dynamic> ? o : {}))
          .toList();
    } else if (json['pollOptions'] is String) {
      try {
        final decodedOptions = jsonDecode(json['pollOptions'] as String);
        if (decodedOptions is List) {
          pollOptionsList = decodedOptions
              .map((o) => PollOption.fromJson(o is Map<String, dynamic> ? o : {}))
              .toList();
        }
      } catch (e) {
        // Handle or log decoding error if necessary
        print('Error decoding pollOptions string: $e');
      }
    }

    return PostModel(
      id: json['\$id'] as String,
      authorName: json['authorName'] as String? ?? '',
      authorTitle: json['authorTitle'] as String? ?? '',
      postTitle: json['postTitle'] as String? ?? '',
      content: json['content'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      pollQuestion: json['pollQuestion'] as String? ?? '',
      comments: commentsList, // Use the processed list
      pollOptions: pollOptionsList, // Use the processed list
      isLiked: json['isLiked'] as bool? ?? false,
      likeCount: json['likeCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authorName': authorName,
      'authorTitle': authorTitle,
      'postTitle': postTitle,
      'content': content,
      'imageUrl': imageUrl,
      'pollQuestion': pollQuestion,
      'comments': comments.map((c) => c.toJson()).toList(),
      'pollOptions': pollOptions.map((o) => o.toJson()).toList(),
      'isLiked': isLiked,
      'likeCount': likeCount,
    };
  }

  /// Increment vote count for poll option at [index].
  void updateVote(int index) {
    if (index >= 0 && index < pollOptions.length) {
      pollOptions[index].votes++;
    }
  }

  PostModel copyWith({
    String? id,
    String? authorName,
    String? authorTitle,
    String? postTitle,
    String? content,
    String? imageUrl,
    String? pollQuestion,
    List<CommentModel>? comments,
    List<PollOption>? pollOptions,
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
      pollQuestion: pollQuestion ?? this.pollQuestion,
      comments: comments ?? this.comments,
      pollOptions: pollOptions ?? this.pollOptions,
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
      option: json['option'] as String? ?? '',
      votes: json['votes'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option': option,
      'votes': votes,
    };
  }
}
