import 'package:community/features/surveys/data/question.dart';

class Survey {
  final String id;
  final String title;
  final String description;
  final String eventId;
  final List<Question> questions;
  
  Survey({
    required this.id,
    required this.title,
    required this.description,
    required this.eventId,
    required this.questions,
  });

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      eventId: map['event_id'],
      questions: List<Question>.from(map['questions'].map((x) => Question.fromMap(x))),
    );
  }
}
