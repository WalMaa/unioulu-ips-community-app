import 'package:community/features/surveys/data/response.dart';

class SurveyResponse {
  final String id;
  final String surveyId;
  final String userId;
  final String eventId;
  final List<Response> responses;
  
  SurveyResponse({
    this.id = '',
    required this.surveyId,
    required this.userId,
    required this.eventId,
    required this.responses,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surveyId': surveyId,
      'userId': userId,
      'eventId': eventId,
      'responses': responses.map((response) => response.toMap()).toList(),
    };
  }

  factory SurveyResponse.fromMap(Map<String, dynamic> map) {
    return SurveyResponse(
      id: map['\$id'] ?? '',
      surveyId: map['surveyId'],
      userId: map['userId'],
      eventId: map['eventId'],
      responses: [],
    );
  }
}