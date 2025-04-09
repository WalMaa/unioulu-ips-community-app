import 'package:community/features/surveys/data/response.dart';

class SurveyResponse {
  final String surveyId;
  final String userId;
  final String eventId;
  final List<Response> responses;
  final DateTime submittedAt;
  
  SurveyResponse({
    required this.surveyId,
    required this.userId,
    required this.eventId,
    required this.responses,
    required this.submittedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'surveyId': surveyId,
      'userId': userId,
      'eventId': eventId,
      'responses': responses.map((response) => response.toMap()).toList(),
      'submittedAt': submittedAt.toIso8601String(),
    };
  }
}