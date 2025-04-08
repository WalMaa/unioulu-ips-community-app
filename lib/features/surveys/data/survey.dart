import 'package:community/features/surveys/data/survey_question.dart';

class Survey {
  final String id;
  final String title;
  final String description;
  final String eventId;
  final List<SurveyQuestion> questions;
  
  Survey({
    required this.id,
    required this.title,
    required this.description,
    required this.eventId,
    required this.questions,
  });

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      id: map['\$id'],
      title: map['title'],
      description: map['description'],
      eventId: map['eventId'],
      questions: []
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'event_id': eventId,
      'questions': List<dynamic>.from(questions.map((x) => x.toMap())),
    };
  }

  @override
  String toString() {
    return 'Survey{id: $id, title: $title, description: $description, eventId: $eventId, questions: $questions}';
  }
}
