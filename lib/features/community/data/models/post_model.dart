import 'comment_model.dart';

class PostModel {
  final String id;
  final String authorName;
  final String authorTitle;
  final String postTitle;
  final String content;
  final String imageUrl;
  List<CommentModel> comments;
  List<PollOption> pollOptions; // Add poll options here

  PostModel({
    required this.id,
    required this.authorName,
    required this.authorTitle,
    required this.postTitle,
    required this.content,
    required this.imageUrl,
    this.comments = const [],
    this.pollOptions = const [], // Initialize with an empty list
  });

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
          .toList() ?? [],
      pollOptions: (json['pollOptions'] as List<dynamic>?)
          ?.map((optionJson) => PollOption.fromJson(optionJson))
          .toList() ?? [],
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
      'pollOptions': pollOptions.map((option) => option.toJson()).toList(),
    };
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