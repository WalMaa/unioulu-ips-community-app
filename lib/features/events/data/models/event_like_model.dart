class EventLikeModel {
  final String eventId; // ID of the post the comment belongs to
  final String userId;

  EventLikeModel({
    required this.eventId,
    required this.userId,
  });

  factory EventLikeModel.fromJson(Map<String, dynamic> json) {
    return EventLikeModel(
      eventId: json['postId'] ?? '',
      userId: json['userId'] ?? 'Anonymous',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId, // Include posts relationship when serializing to JSON
      'userId': userId,
    };
  }
}
